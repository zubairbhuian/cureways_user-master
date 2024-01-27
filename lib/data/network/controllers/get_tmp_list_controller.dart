import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/get_tmp_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class GetTmpListController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');
  String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  List<TmpListData> tmpList = <TmpListData>[];
  List<TmpListData> uniqueList = [];
  List<TmpListData> filteredList = [];

  // **** Filtered List with One key
  void onFilteredList(String key) {
    if (tmpList.isNotEmpty) {
      filteredList = tmpList.where((element) => element.date == key).toList();
    }
  }

  // **** on UnikDietList
  void onUnikDietList() {
    if (tmpList.isNotEmpty) {
      Set<String> uniqueDates = {};
      tmpList
          .where((element) => uniqueDates.add(element.date!))
          .forEach((element) {
        uniqueList.add(element);
      });
    }
  }

  getTmpList() async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {
      'user_id': _myBox.get('userId'),
      "from": fromController.text,
      "to": toController.text,
      
      };
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(endPoint: Endpoints.getTmp, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        var tmpListData = GetTmpModel.fromJson(jsonResponse);

        tmpList = <TmpListData>[];
        tmpList.addAll(tmpListData.data!);
        onFilteredList(todayDate);
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(
            message: 'Something is wrong', backgroundColor: Colors.red);
      }
    });
  }
}
