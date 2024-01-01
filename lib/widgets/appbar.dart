import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilis/const_color.dart';

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
              Column(
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
              SvgPicture.asset(
                "assets/home_screen/bell.svg",
                height: 32,
                width: 32,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
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
