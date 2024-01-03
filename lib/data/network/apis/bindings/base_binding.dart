

import 'package:cureways_user/data/network/controllers/base/api_service.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:get/get.dart';


class BaseBinding extends Bindings {
  final ApiService apiService;

  BaseBinding({required this.apiService});

  @override
  void dependencies() {
    //Get.lazyPut(() => BaseController());
    Get.put(
      BaseController(apiService: apiService),
      permanent: true,
    );
  }
}