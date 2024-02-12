import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlotBookingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;

  bookSlotOnTap(
      BuildContext context,
      String? doctorId,
      String? slotId,
      int? type,
      String? name,
      String? age,
      String? weight,
      String? location,
      String? phone,
      int? gender) async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {
      'doctor_id': doctorId,
      'doctor_slot_id': slotId,
      'type': type,
      'name': name,
      'age': age,
      'weight': weight,
      'location': location,
      'phone': phone,
      'gender': gender,
    };
    kLogger.e(body);
    String jsonBody = json.encode(body);

    server
        .postRequest(endPoint: Endpoints.slotBooking, body: jsonBody)
        .then((response) {
      kLogger.e(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        nameController.clear();
        ageController.clear();
        weightController.clear();
        locationController.clear();
        phoneController.clear();
        Get.rawSnackbar(
            message: 'Successfully Booked!', backgroundColor: Colors.green);
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(
            message: 'Please enter valid input', backgroundColor: Colors.red);
      }
    });
  }
}
