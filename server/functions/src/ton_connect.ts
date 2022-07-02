/* eslint-disable max-len */
import * as functions from "firebase-functions";
import {TonConnectServer, AuthRequestTypes} from "@tonapps/tonconnect-server";
import * as admin from "firebase-admin";
import {sessionConverter} from "./session";

const tonconnect = new TonConnectServer({
  staticSecret: process.env.STATIC_SECRET ?? "",
});

const hostname = process.env.HOST_NAME;
const imageUrl = process.env.IMAGE_URL ?? "";
const returnHost = process.env.RETURN_HOST ?? "";
const androidPackageName = process.env.ANDROID_PACKAGE_NAME ?? "";
const iosBundleId = process.env.IOS_BUNDLE_ID ?? "";

exports.tonConnect = functions
    .https
    .onRequest(async (request, response) => {
      functions.logger.debug(`body = ${JSON.stringify(request.body)} query = ${JSON.stringify(request.query)}`);

      const returnUrl = `${returnHost}/?apn=${androidPackageName}&this=${iosBundleId}&link=https://${returnHost}/tonConnectCallback/`;
      functions.logger.debug(`returnUrl = ${returnUrl}`);

      const result = tonconnect.createRequest({
        image_url: imageUrl,
        callback_url: `https://${hostname}/tonConnectCallback?session=${request.query.session}`,
        return_url: returnUrl,
        return_serverless: true,
        items: [{
          type: AuthRequestTypes.ADDRESS,
          required: true,
        }, {
          type: AuthRequestTypes.OWNERSHIP,
          required: true,
        }],
      });

      functions.logger.debug(`result = ${JSON.stringify(result)}`);

      response.send(result);
    });

exports.tonConnectCallback = functions
    .https
    .onRequest(async (request, response) => {
      functions.logger.debug(`body = ${JSON.stringify(request.body)} query = ${JSON.stringify(request.query)}`);

      try {
        const encodedResponse = request.query.tonlogin as string;
        const decodeResponse = tonconnect.decodeResponse(encodedResponse);

        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const result: any = {decodeResponse};


        let verified = false;
        let address = "";

        for (const payload of decodeResponse.payload) {
          switch (payload.type) {
            case AuthRequestTypes.OWNERSHIP:
              // eslint-disable-next-line no-case-declarations
              verified = await tonconnect.verifyTonOwnership(
                  payload,
                  decodeResponse.client_id,
              );

              address = payload.address;

              result.message = verified ?
                            `ton-ownership is verified for ${payload.address}` :
                            "ton-ownership is NOT verified";

              break;
            case AuthRequestTypes.ADDRESS:
              result.message = `ton-address ${payload.address}`;
              break;
          }
        }

        await admin.firestore()
            .collection("session")
            .doc(request.query.session as string)
            .withConverter(sessionConverter)
            .set({address: address});

        functions.logger.debug(`result = ${JSON.stringify(result)}`);

        response.send(result);
      } catch (error) {
        console.log(error);
        response.status(400).send({error});
      }
    });
