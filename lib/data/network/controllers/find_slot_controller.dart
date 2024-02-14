import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/find_slot_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/available_slot_screen.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/doctor_appoinment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindSlotController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  List<FindSlotData> slotData = <FindSlotData>[];

  findSlotOnTap(BuildContext context, String? doctorId, String? date) async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {'doctor_id': doctorId, 'date': date};
    String jsonBody = json.encode(body);

    server
        .postRequest(endPoint: Endpoints.findSlot, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        var findSlotData = FindSlotModel.fromJson(jsonResponse);

        slotData = <FindSlotData>[];
        slotData.addAll(findSlotData.slotData!);

        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.to(() =>
            AvailableSlotScreen(doctorId: doctorId, slotDataList: slotData));
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'No Slot Found', backgroundColor: Colors.red);
      }
    });
  }
}
