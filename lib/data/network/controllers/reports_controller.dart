import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/get_diet_list_model.dart';
import 'package:cureways_user/data/network/models/report_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/popup_dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../models/base/base_model.dart';

class ReportsController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');
  String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  List<ReportsModel>? resultList;
  List<ReportsModel> uniqueList = [];
  List<ReportsModel> todayFilteredList = [];

  // **** Filtered List with One key
  void onFilteredList(String key) {
    if (resultList != null) {
      todayFilteredList =
          resultList!.where((element) => element.date == key).toList();
      kLogger.e(todayFilteredList.length);
    }
  }

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timePeriodController = TextEditingController();
  final TextEditingController resultController = TextEditingController();
  String? selectedTestName;

  storeReports() async {
    loader = true;
    update();
    Map<String, dynamic> data = {
      'user_id': _myBox.get('userId'),
      'date': dateController.text,
      'time': timePeriodController.text,
      'test_name': selectedTestName,
      'result': resultController.text,
    };

    kLogger.i(data);
    final FormData formData = FormData.fromMap(data);
    update();
    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.reportsTracker, formData);
    loader = false;
    update();
    if (res.statusCode == 200) {
      dateController.clear();
      timePeriodController.clear();
      resultController.clear();
      PopupDialog.showSuccessDialog("Diet Tracker Added");
    } else if (res.statusCode == 422) {
      PopupDialog.showErrorMessage("All field is required");
    }
  }

  getReportList() async {
    resultList = [];
    update();
    Map<String, dynamic> map = {
      "user_id": _myBox.get('userId'),
      "from": fromController.text,
      "to": toController.text,
    };
    final FormData formData = FormData.fromMap(map);
    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.getDiet, formData);
    if (res.statusCode == 200) {
      if (res.data["data"].isEmpty) {
        resultList = [];
      } else {
        // if there is no data
        resultList = (res.data['data'] as List)
            .map((item) => ReportsModel.fromJson(item))
            .toList();
        onFilteredList(todayDate);
        update();
      }

      update();
    } else {
      update();
    }
  }
}
