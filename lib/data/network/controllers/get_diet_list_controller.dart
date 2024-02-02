import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:cureways_user/data/network/models/get_diet_list_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class GetDietListController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  final _myBox = Hive.box('userBox');

  String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  List<DietListData>? dietList;
  List<DietListData> uniqueList = [];
  List<DietListData> todayFilteredList = [];

  // **** Filtered List with One key
  void onFilteredList(String key) {
    if (dietList != null) {
      todayFilteredList =
          dietList!.where((element) => element.date == key).toList();
      kLogger.e(todayFilteredList.length);
    }
  }

  // **** on UnikDietList
  // void onUnikDietList() {
  //   if (dietList != null && dietList!.isNotEmpty) {
  //     Set<String> uniqueDates = {};
  //     dietList
  //         ?.where((element) => uniqueDates.add(element.date!))
  //         .forEach((element) {
  //       uniqueList.add(element);
  //       update();
  //     });
  //   }
  // }

  getDietList() async {
    dietList = [];
    update();
    Map<String, dynamic> map = {
      "user_id": _myBox.get('userId'),
      "from": fromController.text,
      "to": toController.text,
    };
    kLogger.i(map);
    final FormData formData = FormData.fromMap(map);
    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.getDiet, formData);
    if (res.statusCode == 200) {
      if (res.data["data"].isEmpty) {
        dietList = [];
      } else {
        // if there is no data
        dietList = (res.data['data'] as List)
            .map((item) => DietListData.fromJson(item))
            .toList();
        onFilteredList(todayDate);
        update();
      }

      update();
    } else {
      dietList = [];
      update();
    }
  }
}
