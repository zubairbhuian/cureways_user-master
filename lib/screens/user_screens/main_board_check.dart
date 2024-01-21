import 'package:cureways_user/screens/about_us/about_us_screen.dart';
import 'package:cureways_user/screens/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../utils/const_color.dart';
import '../home_screen.dart';

class MainBoardCheck extends StatefulWidget {
  const MainBoardCheck({Key? key}) : super(key: key);
  @override
  State<MainBoardCheck> createState() => _MainBoardCheckState();
}

class _MainBoardCheckState extends State<MainBoardCheck> {
  int pageIndex = 0;
  dynamic userName;

  final _myBox = Hive.box('userBox');

  @override
  void initState() {
    userName = _myBox.get('userName');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        userName: userName,
      ),
      AboutusScreen(userName: userName),
      const ProfileView(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kTextColorLight,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/home_outline.svg"),
                activeIcon: SvgPicture.asset("assets/icons/home_filed.svg"),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/about_outline.svg"),
                activeIcon: SvgPicture.asset("assets/icons/about_field.svg"),
                label: "About"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/profile_outline.svg"),
                activeIcon: SvgPicture.asset("assets/icons/profile_field.svg"),
                label: "Profile"),
          ]),
    );
  }
}
