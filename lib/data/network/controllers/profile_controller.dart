import 'dart:io';

import 'package:cureways_user/screens/welcome_screen.dart';
import 'package:cureways_user/utils/my_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  // textEditting controller
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  File? bannerImgFile;
  File? profileImgFile;
  String userPhoto = "";
  String userName = "";
  String userEmail = "";

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

  // ******* Get user info
  getUserInfo() {
    var myBox = Hive.box('userBox');
    // name
    var name = myBox.get('userName');
    fullNameController = TextEditingController(text: name);
    //photo
    var photo = myBox.get('userPhoto');
    userPhoto = photo;
    //email
    var email = myBox.get('email');
    emailController = TextEditingController(text: email);
    update();
  }
  // ******* Log Out
  onLogOut() async {
    // clean SharedPreferences data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // clean HoveBox  data
    var box = await Hive.openBox('userBox');
    await box.clear();

    // Route For Login
    Get.offAll(const WelcomescreenCheck());
  }

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }
}
