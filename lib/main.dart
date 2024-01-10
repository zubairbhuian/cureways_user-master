import 'package:cureways_user/screens/splash.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/network/apis/bindings/base_binding.dart';
import 'data/network/controllers/base/api_service.dart';
import 'data/network/controllers/base/dio_interceptor.dart';
import 'data/network/controllers/global_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userBox');

  /// mobile orientation off
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  /// Initialize the dio
  final dio = Dio();
  // Initialize the dio instance
  dio.interceptors.add(DioInterceptor());
  /// Add the dio instance to the api service
  final apiService = ApiService(dio: dio);
  Get.put(GlobalController());
  runApp(MyApp(
    apiService: apiService,
  ));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;
  const MyApp({super.key, required this.apiService});
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
            initialBinding: BaseBinding(
              apiService: apiService,
            ),
            home: const Splash(),
            // home:  HealtipsMainScreen(userName: "zubair",),
          );
        });
  }
}
