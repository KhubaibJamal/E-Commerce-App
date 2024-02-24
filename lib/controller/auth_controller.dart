import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Future<UserCredential?> login(String email, String password, context) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context,
          msg: e.toString(), bgColor: redColor, textColor: whiteColor);
    }
    return userCredential;
  }

  Future<UserCredential?> singUp(String email, String password, context) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context,
          msg: e.toString(), bgColor: redColor, textColor: whiteColor);
    }
    return userCredential;
  }

  storeUserData(String email, String password, String name) async {
    DocumentReference db = firestore
            .collection(userCollection)
            .doc(currentUser!.uid)
            .set({'name': name, 'email': email, 'password': password})
        as DocumentReference<Object?>;
  }

  userLogOut(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context,
          msg: e.toString(), bgColor: redColor, textColor: whiteColor);
    }
  }
}
