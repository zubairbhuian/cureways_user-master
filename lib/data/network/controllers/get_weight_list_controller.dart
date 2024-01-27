import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/get_weight_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class GetWeightListController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');
  String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  List<WeightListData> weightList = [];
  List<WeightListData> uniqueList = [];
  List<WeightListData> filteredList = [];

  // **** Filtered List with One key
  void onFilteredList(String key) {
    if (weightList.isNotEmpty) {
      filteredList =
          weightList.where((element) => element.date == key).toList();
    }
  }

  // // **** on UnikDietList
  // void onUnikDietList() {
  //   if (weightList.isNotEmpty) {
  //     Set<String> uniqueDates = {};
  //     weightList
  //         .where((element) => uniqueDates.add(element.date!))
  //         .forEach((element) {
  //       uniqueList.add(element);
  //     });
  //   }
  // }

  getWeightList() async {
    weightList = [];
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
        .postRequestWithToken(endPoint: Endpoints.getWeight, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        var weightData = GetWeightModel.fromJson(jsonResponse);
        weightList.addAll(weightData.data!);
        onFilteredList(todayDate);

        loader = false;
        update();
      } else {
        loader = false;
        update();

        Get.rawSnackbar(
            message: 'Something is wrong', backgroundColor: Colors.red);
      }
    });
  }
}
