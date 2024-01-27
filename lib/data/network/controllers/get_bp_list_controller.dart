import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/get_bp_list_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class GetBpListController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');
  String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  List<GetBpListData> bpList = <GetBpListData>[];
  List<GetBpListData> uniqueList = [];
  List<GetBpListData> filteredList = [];

  // **** Filtered List with One key
  void onFilteredList(String key) {
    if (bpList.isNotEmpty) {
      filteredList = bpList.where((element) => element.date == key).toList();
    }
  }

  // // **** on UnikDietList
  // void onUnikDietList() {
  //   if (bpList.isNotEmpty) {
  //     Set<String> uniqueDates = {};
  //     bpList
  //         .where((element) => uniqueDates.add(element.date!))
  //         .forEach((element) {
  //       uniqueList.add(element);
  //     });
  //   }
  // }

  getBpList() async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    Map body = {
      'user_id': _myBox.get(
        'userId',
      ),
      "from": fromController.text,
      "to": toController.text,
    };
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(endPoint: Endpoints.getBp, body: jsonBody)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        bpList = (jsonResponse['data'] as List)
            .map((item) => GetBpListData.fromJson(item))
            .toList();
        onFilteredList(todayDate);
        kLogger.e(filteredList.length);
        loader = false;
        update();
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
