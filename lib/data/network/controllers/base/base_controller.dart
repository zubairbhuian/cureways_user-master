import 'package:cureways_user/data/network/controllers/base/api_service.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();
  final ApiService apiService;

  BaseController({required this.apiService});


}