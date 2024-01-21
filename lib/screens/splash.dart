import 'dart:async';

import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/screens/user_screens/main_board_check.dart';
import 'package:cureways_user/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  UserService userService = UserService();

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => logInCheck(),
    );
    super.initState();
  }

  logInCheck() async {
    var isUser = await userService.getBool();
    if (isUser == true) {
      Get.off(() => const MainBoardCheck());
    } else {
      Get.off(() => const WelcomescreenCheck());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
      ),
    );
  }
}
