import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/get_weight_list_controller.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class StoreWeightController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  final _myBox = Hive.box('userBox');

  final TextEditingController dateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  storeWeight() async {
    loader = true;
   
    Map body = {
      'user_id': _myBox.get('userId'),
      'date': dateController.text,
      'weight': weightController.text,
    };
    String jsonBody = json.encode(body);
    try {
          server
        .postRequestWithToken(endPoint: Endpoints.storeWeight, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        Get.find<GetWeightListController>().getWeightList();
        dateController.clear();
        weightController.clear();
        loader = false;
        update();
        Get.rawSnackbar(message: 'Submitted!', backgroundColor: Colors.green);
      } else {
        loader = false;
        update();
        Get.rawSnackbar(
            message: 'Please enter valid input', backgroundColor: Colors.red);
      }
    });
    
    } catch (e) {
      loader = false;
      

     kLogger.e('Error from %%%% store weight %%%% => $e');
    }

  }
}
