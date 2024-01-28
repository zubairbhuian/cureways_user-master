import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/popup_dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:hive/hive.dart';

import 'base/base_controller.dart';

class StoreDietController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timePeriodController = TextEditingController();
  final TextEditingController foodInCaloriesController =
      TextEditingController();
  final TextEditingController foodTypeController = TextEditingController();

  storeDiet() async {
    loader = true;
    update();
    Map<String, dynamic> data = {
      'user_id': _myBox.get('userId'),
      'date': dateController.text,
      'time': timePeriodController.text,
      'food_type': foodTypeController.text,
      'food_qty': foodInCaloriesController.text,
    };
    kLogger.i(data);
    final FormData formData = FormData.fromMap(data);
    update();
    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.storeDiet, formData);
    loader = false;
    update();
    if (res.statusCode == 200) {
      Get.put(GetDietListController()).getDietList();
      dateController.clear();
      timePeriodController.clear();
      foodInCaloriesController.clear();
      PopupDialog.showSuccessDialog("Diet Tracker Added");
    } else if (res.statusCode == 422) {
      PopupDialog.showErrorMessage("All field is required");
    }
  }
}
