import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/get_glucose_list_controller.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class StoreGlucoseController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');
  
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController resultController = TextEditingController();
  final TextEditingController timePeriodController = TextEditingController();

  storeGlucose() async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    String formetTimePeriodName(String text) {
      kLogger.e(text);
      if (text == 'Fasting') {
        return "1";
      } else if (text == 'Random') {
        return "2";
      }
      return "3";
    }

    var timePeriodName = formetTimePeriodName(timePeriodController.text);

    Map body = {
      'user_id': _myBox.get('userId'),
      'date': dateController.text,
      'time': timeController.text,
      'time_period': timePeriodName,
      'test_result': resultController.text,
    };
    kLogger.e(body);
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(endPoint: Endpoints.storeGlucose, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        Get.find<GetGlucoseListController>().getGlucoseList();

        dateController.clear();
        timeController.clear();
        resultController.clear();
        timePeriodController.clear();

        loader = false;
        update();
        Get.rawSnackbar(message: 'Submitted!', backgroundColor: Colors.green);
      } else {
        loader = false;
        update();
        Get.rawSnackbar(
            message: 'Please enter valid input', backgroundColor: Colors.red);
      }
    });
  }
}
