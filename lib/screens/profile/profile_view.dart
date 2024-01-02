import 'package:cureways_user/data/network/controllers/profile_controller.dart';
import 'package:cureways_user/screens/welcome_screen.dart';
import 'package:cureways_user/utils/Int_extensions.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:cureways_user/widgets/profile_pic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // profile
            30.height,
            const ProfilePicCard(),

            // user info
            40.height,
            const Text(
              "User Information",
              style: TextStyle(
                  color: kTextColor, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            10.height,
             CustomTextField2(
              label: Text("Full Name"),
              controller:controller.fullNameController,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kDisabledTextColor)),
              child: InternationalPhoneNumberInput(
                  inputDecoration:
                      const InputDecoration(border: InputBorder.none),
                  onInputChanged: (value) {}),
            ),
            24.height,
            CustomTextField2(
              label: Text("Email"),
              controller:controller.emailController,
            ),
            CustomDropdownTextFiel(
                data: const ["Male", "Female", "Others"],
                onChanged: (value) {}),
            // Logout Btn
            30.height,
            GestureDetector(
              onTap: () {
                Get.offAll(const WelcomescreenCheck());
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: kDangerColor,
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                      color: kWhite, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
