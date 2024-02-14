import 'package:cureways_user/screens/health_profile/add_health_profile_screen.dart';
import 'package:cureways_user/screens/health_profile/update_health_profile_screen.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/mixins.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: const CustomAppBar(title: Text("Health Profile")),
      body: Container(
        height: 120,
        padding:  EdgeInsets.only(left: 20.w, right: 20.w),
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
                      Icon(Mixins().healthProfileMenuItem.elementAt(index)["iconData"],size: 33,color: kWhite,),
                    
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
