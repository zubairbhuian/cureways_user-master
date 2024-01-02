import 'dart:io';

import 'package:cureways_user/utils/my_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  // textEditting controller
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  File? bannerImgFile;
  File? profileImgFile;

  // ******* pick and crop img
  onPickProfileImage() async {
    profileImgFile = await MyImagePicker.pickImageAndCrop();
    update();
  }

  // ******* pick and crop img
  onPickBannerImage() async {
    bannerImgFile = await MyImagePicker.pickImageAndCrop();
    update();
  }

}
