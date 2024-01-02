import 'package:cureways_user/screens/health_profile/add_health_profile_screen.dart';
import 'package:cureways_user/screens/splash.dart';
import 'package:cureways_user/screens/user_screens/health_tips/health_tips_main_screen.dart';
import 'package:cureways_user/screens/user_screens/main_board_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/network/controllers/profile_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('userBox');
  Get.put(ProfileController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const Splash(),
            // home:  HealtipsMainScreen(userName: "zubair",),
          );
        });
  }
}
