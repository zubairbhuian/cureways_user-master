import 'package:cureways_user/data/network/controllers/get_glucose_list_controller.dart';
import 'package:cureways_user/data/network/controllers/profile_controller.dart';
import 'package:cureways_user/utils/Int_extensions.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:cureways_user/widgets/profile_pic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  void initState() {
     Get.put(ProfileController()).getUserInfo();
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    ProfileController controller =Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // profile
            100.height,
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
              label: const Text("Full Name"),
              controller: controller.fullNameController,
            ),
            // ! phone Number
            // Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       border: Border.all(color: kDisabledTextColor)),
            //   child: InternationalPhoneNumberInput(
            //       inputDecoration:
            //           const InputDecoration(border: InputBorder.none),
            //       onInputChanged: (value) {}),
            // ),
            CustomTextField2(
              label: const Text("Email"),
              controller: controller.emailController,
            ),
            // CustomDropdownTextFiel(
            //     data: const ["Male", "Female", "Others"],
            //     onChanged: (value) {}),
            // Logout Btn
            10.height,
            GestureDetector(
              onTap: () {
                controller.onLogOut();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
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
