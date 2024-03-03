import 'package:emart/consts/consts.dart';

class FirebaseService {
  static getUser(String uid) {
    return firestore
        .collection(userCollection)
        .where('userId', isEqualTo: uid)
        .snapshots();
  }
}
