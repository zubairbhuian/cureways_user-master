import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/get_glucose_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class GetGlucoseListController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');
  List<GlucoseListData> glucoseList = <GlucoseListData>[];
  List<GlucoseListData> uniqueList = [];
  List<GlucoseListData> filteredList = [];

  // **** Filtered List with One key
  void onFilteredList(String key) {
    if (glucoseList.isNotEmpty) {
      filteredList =
          glucoseList.where((element) => element.date == key).toList();
    }
  }

  // **** on UnikDietList
  void onUnikDietList() {
    if (glucoseList.isNotEmpty) {
      Set<String> uniqueDates = {};
      glucoseList
          .where((element) => uniqueDates.add(element.date!))
          .forEach((element) {
        uniqueList.add(element);
      });
    }
  }

  getGlucoseList() async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {'user_id': _myBox.get('userId')};
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(endPoint: Endpoints.getGlucose, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        var glucoseListData = GetGlucoseModel.fromJson(jsonResponse);

        glucoseList = <GlucoseListData>[];
        glucoseList.addAll(glucoseListData.data!);
        onUnikDietList();

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
