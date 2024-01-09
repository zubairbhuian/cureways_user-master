import 'package:cureways_user/utils/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/const_color.dart';
import '../utils/style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final VoidCallback? onLeading;
  final double? preferredHeight;
  final List<Widget>? actions;

  final bool centerTitle;
  final bool? hasBackBTN;

  const CustomAppBar(
      {super.key,
      this.title,
      this.onLeading,
      this.preferredHeight,
      this.actions,
       this.centerTitle=true,
       this.hasBackBTN=true,
    });

// Specify the desired height of the AppBar
  @override
  Size get preferredSize => Size.fromHeight(preferredHeight ?? 66.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      centerTitle: centerTitle,
      leadingWidth: 60,
      backgroundColor: kPrimaryColor,
      foregroundColor: kTextColor,
      titleTextStyle: kTitleLarge.copyWith(color: kWhite),
      // appbar leading
      leading:hasBackBTN==true? GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Center(
          child: CircleAvatar(
            radius: 24,
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: kWhite,
            ),
          ),
        ),
      ):null,
      // appbar title
      title: title,
      // appbar actions),
    );
  }
}

class AppDefaultBar extends StatelessWidget {
  String title;
  String userNAme;

  AppDefaultBar({
    required this.title,
    required this.userNAme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 152,
      automaticallyImplyLeading: false,
      backgroundColor: ConstantsColor.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0)),
      ),
      title: Column(
        children: [
          //SizedBox(height: 42,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hi,$userNAme",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Text(
                      "Welcome back",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SvgPicture.asset(
                "assets/home_screen/bell.svg",
                height: 32,
                width: 32,
                color: Colors.white,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
