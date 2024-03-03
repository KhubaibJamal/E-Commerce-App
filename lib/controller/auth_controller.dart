import 'package:emart/consts/consts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

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

  storeUserData(String email, String name) async {
    try {
      String uid = currentUser!.uid;
      await firestore.collection(userCollection).doc(uid).set({
        'name': name,
        'email': email,
        'profilePicture': '',
        'userId': uid,
      });
    } catch (e) {
      print("Error storing user data: $e");
    }
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
