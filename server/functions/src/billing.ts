/* eslint-disable max-len */
import * as functions from "firebase-functions";
import {BillingNotification} from "./billing_notification";
import {google} from "googleapis";
import {CloudBillingClient} from "@google-cloud/billing";
import {GoogleAuth} from "google-auth-library";

const budgetId = process.env.BUDGET_ID;
const billingAccountId = process.env.BILLING_ACCOUNT_ID;
const budgetLimit = parseInt(process.env.BUDGET_LIMIT ?? "10");

const PROJECT_ID = process.env.GOOGLE_CLOUD_PROJECT;
const PROJECT_NAME = `projects/${PROJECT_ID}`;
const billing = new CloudBillingClient();

// / https://cloud.google.com/billing/docs/how-to/notify
exports.billingPubSub = functions
    .pubsub
    .topic("billing-pub-sub")
    .onPublish(async (message) => {
      const billing = message.json as BillingNotification;
      functions.logger.debug(`PROJECT_ID = ${PROJECT_ID}, new billing: ${JSON.stringify(billing)}`);

      if (budgetId !== message.attributes.budgetId) {
        functions.logger.error("wrong budgetId");
        return;
      }

      if (billingAccountId !== message.attributes.billingAccountId) {
        functions.logger.error("wrong billingAccountId");
        return;
      }

      if (billing.costAmount >= budgetLimit) {
        functions.logger.debug("❌ Budget limit reached! Stop billing ❌");
        _setAuthCredential();
        const billingEnabled = await _isBillingEnabled(PROJECT_NAME);
        let status;
        if (billingEnabled) {
          status = _disableBillingForProject(PROJECT_NAME);
        } else {
          status = "Billing already disabled";
        }
        functions.logger.debug(`Current status is ${status}`);
      }
    });

const _setAuthCredential = () => {
  const client = new GoogleAuth({
    scopes: [
      "https://www.googleapis.com/auth/cloud-billing",
      "https://www.googleapis.com/auth/cloud-platform",
    ],
  });

  // Set credential globally for all requests
  google.options({
    auth: client,
  });
};

const _isBillingEnabled = async (projectName: string) => {
  try {
    const [res] = await billing.getProjectBillingInfo({name: projectName});
    return res.billingEnabled;
  } catch (e) {
    functions.logger.error(
        "Unable to determine if billing is enabled on specified project, assuming billing is enabled",
    );
    return true;
  }
};

const _disableBillingForProject = async (projectName: string) => {
  const res = await billing.updateProjectBillingInfo({
    name: projectName,
    projectBillingInfo: {billingAccountName: ""},
  });
  return `Billing disabled: ${JSON.stringify(res)}`;
};
