import * as admin from "firebase-admin";
import {firestore} from "firebase-admin";
import FirestoreDataConverter = firestore.FirestoreDataConverter;
import {removeUndefined} from "./utils";

export interface Session {
    address: string;
}

export const sessionConverter: FirestoreDataConverter<Session> = {
  toFirestore(session: Session): admin.firestore.DocumentData {
    const result: firestore.DocumentData = {
      address: session.address,
    };

    return removeUndefined(result);
  },
  fromFirestore(snapshot: admin.firestore.QueryDocumentSnapshot): Session {
    const data = snapshot.data();

    return {
      address: data.address,
    };
  },
};
