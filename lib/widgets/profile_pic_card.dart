import 'dart:io';
import 'package:cureways_user/data/network/controllers/profile_controller.dart';
import 'package:cureways_user/widgets/network_img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfilePicCard extends StatelessWidget {
  const ProfilePicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) {
            File? imgFile = controller.profileImgFile;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(800),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffECEDF2),
                    radius: 60,
                    child: imgFile == null
                        ?  NetworkImg(
                            controller.userPhoto,
                            errUrl: 'assets/images/default_user.png',
                          )
                        : Image(
                            width: double.infinity,
                            height: double.infinity,
                            image: FileImage(imgFile),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                    right: -10,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        controller.onPickProfileImage();
                      },
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ))
              ],
            );
          }),
        )
      ],
    );
  }
}
