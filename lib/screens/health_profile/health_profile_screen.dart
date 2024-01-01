import 'package:cureways_user/screens/health_profile/add_health_profile_screen.dart';
import 'package:cureways_user/screens/health_profile/update_health_profile_screen.dart';
import 'package:cureways_user/utilis/const_color.dart';
import 'package:cureways_user/utilis/mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'get_health_profile_screen.dart';

class HealthProfileScreen extends StatefulWidget {
  const HealthProfileScreen({super.key});

  @override
  State<HealthProfileScreen> createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends State<HealthProfileScreen> {
  final _myBox = Hive.box('userBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      "Hi,${_myBox.get('userName')}",
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
            const SizedBox(height: 16),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEALTH PROFILE',
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
      ),
      body: Container(
        height: 120,
        alignment: Alignment.topCenter,
        child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 105,
            ),
            itemCount: Mixins().healthProfileMenuItem.length,
            // scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  switch (Mixins()
                      .healthProfileMenuItem
                      .elementAt(index)["title"]) {
                    case "Add\nHealth Profile":
                      Get.to(() => AddHealthProfileScreen(
                          userName: _myBox.get('userName')));
                      break;
                    case "Show\nHealth Profile":
                      Get.to(() => const GetHealthProfileScreen());
                      break;
                    case "Update\nHealth Profile":
                      Get.to(() => const UpdateHealthProfileScreen());
                      break;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ConstantsColor.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 80,
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                            "${Mixins().healthProfileMenuItem.elementAt(index)["images"]}"),
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${Mixins().healthProfileMenuItem.elementAt(index)["title"]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
