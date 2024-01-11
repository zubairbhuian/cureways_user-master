import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
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
  final TextEditingController foodInCaloriesController =TextEditingController();
  final TextEditingController foodTypeController =TextEditingController();

  storeDiet() async {
    loader = true;
    update();
    // Future.delayed(const Duration(milliseconds: 10), () {
    //   update();
    // });

    final FormData formData = FormData.fromMap({
      'user_id': _myBox.get('userId'),
      'date': dateController.text,
      'time': timePeriodController.text,
      'foodType':foodTypeController.text,
      'food_qty': foodInCaloriesController.text,
    });
    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.storeDiet, formData);
    loader = false;
    update();
    if (res.statusCode == 200) {
      dateController.clear();
      timePeriodController.clear();
      foodInCaloriesController.clear();
      PopupDialog.showSuccessDialog("Diet Tracker Added");
    } else if (res.statusCode == 422) {
      PopupDialog.showErrorMessage("All field is required");
    }
    // Map body = {
    //   'user_id': _myBox.get('userId'),
    //   'date': date,
    //   'time': time,
    //   'food_qty': foodQty,
    // };

    // String jsonBody = json.encode(body);

    // server
    //     .postRequestWithToken(endPoint: Endpoints.storeDiet, body: jsonBody)
    //     .then((response) {
    //   kLogger.d(json.decode(response.body));

    //   if (response != null && response.statusCode == 200) {
    //     final jsonResponse = json.decode(response.body);
    //     print(jsonResponse);

    //     dateController.clear();
    //     timePeriodController.clear();
    //     foodInCaloriesController.clear();

    //     loader = false;
    //     Future.delayed(const Duration(milliseconds: 10), () {
    //       update();
    //     });
    //     Get.rawSnackbar(message: 'Submitted!', backgroundColor: Colors.green);
    //   } else {
    //     loader = false;
    //     Future.delayed(const Duration(milliseconds: 10), () {
    //       update();
    //     });
    //     Get.rawSnackbar(
    //         message: 'Please enter valid input', backgroundColor: Colors.red);
    //   }
    // });
  }
}
