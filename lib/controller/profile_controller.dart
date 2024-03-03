import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var imagePath = ''.obs;
  var profileImageLink = '';
  var isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  getImage(context) async {
    try {
      final pickedImagePath =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImagePath != null) {
        imagePath.value = pickedImagePath.path;
      }
    } on PlatformException catch (e) {
      VxToast.show(context,
          msg: e.toString(), bgColor: redColor, textColor: whiteColor);
    }
  }

  uploadImage() async {
    var fileName = basename(imagePath.value);
    var destination = 'images/${currentUser!.uid}/$fileName';
    Reference reference = FirebaseStorage.instance.ref().child(destination);
    await reference.putFile(File(imagePath.value));
    profileImageLink = await reference.getDownloadURL();
  }

  // updateUserData({required String name, required String profilePicture}) async {
  //   try {
  //     await firestore.collection(userCollection).doc(currentUser!.uid).set({
  //       'name': name,
  //       'profilePicture': profilePicture,
  //     }, SetOptions(merge: true));
  //     isLoading(false);
  //   } catch (e) {
  //     print("Error updating user data: $e");
  //     isLoading(false);
  //   }
  // }
  updateUserData({required String name, String? profilePicture}) async {
    try {
      var userData = {
        'name': name,
      };
      if (profilePicture != null) {
        userData['profilePicture'] = profilePicture;
      }
      await firestore.collection(userCollection).doc(currentUser!.uid).set(
            userData,
            SetOptions(merge: true),
          );
      isLoading(false);
    } catch (e) {
      print("Error updating user data: $e");
      isLoading(false);
    }
  }
}
