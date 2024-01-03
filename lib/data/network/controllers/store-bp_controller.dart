import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/widgets/popup_dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:hive/hive.dart';

class StoreBpController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');
  final TextEditingController dateController = TextEditingController();
  final TextEditingController systolicBpController = TextEditingController();
  final TextEditingController diastolicBpController = TextEditingController();

  storeBp(BuildContext context, String? date, String? systolic,
      String? diastolic) async {
    loader = true;
    update();
    // Future.delayed(const Duration(milliseconds: 10), () {
    //   update();
    // });
    final FormData formData = FormData.fromMap({
      'user_id': _myBox.get('userId'),
      'date': date,
      'sysotolic': systolic,
      'diastolic': diastolic,
    });
    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.storeBp, formData);
    loader = false;
    update();
    if (res.statusCode == 200) {
      PopupDialog.showSuccessDialog("BP Tracker Added");
    } else if (res.statusCode == 422) {
      PopupDialog.showErrorMessage("All field is required");
    }
    // Map body = {
    //   'user_id': _myBox.get('userId'),
    //   'date': date,
    //   'sysotolic': systolic,
    //   'diastolic': diastolic,
    // };
    // String jsonBody = json.encode(body);

    // server
    //     .postRequestWithToken(endPoint: Endpoints.storeBp, body: jsonBody)
    //     .then((response) {
    //   print(json.decode(response.body));
    //   if (response != null && response.statusCode == 200) {
    //     final jsonResponse = json.decode(response.body);
    //     print(jsonResponse);

    //     dateController.clear();
    //     systolicBpController.clear();
    //     diastolicBpController.clear();

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
