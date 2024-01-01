import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/store_ask_doctor_response_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class StoreAskDoctorController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  final _myBox = Hive.box('userBox');
  bool loader = false;
  final TextEditingController questionController = TextEditingController();
  dynamic que, ans;

  storeAskDoctor(BuildContext context, String? question) async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {
      'user_id': '',
      'question_user_id': _myBox.get('userId'),
      'question': question,
      'ans': ''
    };
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(
            endPoint: Endpoints.askDoctorStore, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        var askDoctorData = StoreAskDoctorResponseModel.fromJson(jsonResponse);
        que = askDoctorData.data!.question;
        ans = askDoctorData.data!.ans;
        questionController.clear();
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
