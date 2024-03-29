import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();
  Server server = Server();

  UserService userService = UserService();
  bool profileLoader = true;
  String? bearerToken,
      siteName,
      customerAppName,
      siteEmail,
      siteLogo,
      customerAppLogo,
      currencyCode,
      currencyName,
      supportNum,
      googleMapApiKey,
      stripeSecret,
      stripeKey,
      paystacKey,
      razorpayKey,
      razorpaySecret;
  bool isUser = false;
  String? userId;
  String? get currency => currencyCode;

  initController() async {
    final validUser = await userService.loginCheck();
    print(validUser);
    isUser = validUser;
    print('global isUser: $isUser');
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    if (isUser) {
      final token = await userService.getToken();
      final myId = await userService.getUserId();
      bearerToken = token;
      userId = myId;
      Future.delayed(const Duration(milliseconds: 10), () {
        update();
      });
      Server.initClass(token: bearerToken);
    }
  }

  @override
  void onInit() {
    initController();
    getValue();
    super.onInit();
  }

  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('token');
    return stringValue;
  }
}
