import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/get_ask_doctor_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAskDoctorController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  dynamic ansName, que, ans;
  List<GetAskDoctorData> getAskDoctorList = <GetAskDoctorData>[];

  getAskDoctor() async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {};
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(endPoint: Endpoints.getAskDoctor, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        var getAskDoctorData = GetAskDoctorModel.fromJson(jsonResponse);

        getAskDoctorList = <GetAskDoctorData>[];
        getAskDoctorList.addAll(getAskDoctorData.data!);

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
