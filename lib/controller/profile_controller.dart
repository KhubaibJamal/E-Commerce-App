import 'package:emart/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var imagePath = ''.obs;

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
}
