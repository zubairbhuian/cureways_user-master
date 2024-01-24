import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:cureways_user/data/network/models/get_health_profile_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/popup_dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:hive/hive.dart';

class AddHealthProfileController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  final _myBox = Hive.box('userBox');
  bool loader = false;
  dynamic healthProfileId;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController msController = TextEditingController();
  final TextEditingController chiefComplainController = TextEditingController();
  final TextEditingController prevDiseaseController = TextEditingController();
  final TextEditingController prevOtHistoryController = TextEditingController();
  final TextEditingController medicationController = TextEditingController();
  final TextEditingController physicalDisabilitiesController =
      TextEditingController();
  final TextEditingController prevTestResultController =
      TextEditingController();
  dynamic age,
      gender,
      height,
      weight,
      marital,
      chiefComplain,
      prevDisease,
      otHistory,
      medication,
      disabilities,
      testResult;

  addHealthProfile(
    BuildContext context,
    String? id,
    String? age,
    String? gender,
    String? height,
    String? weight,
    String? marital,
    String? chiefComplain,
    String? prevDisease,
    String? otHistory,
    String? medication,
    String? disabilities,
    String? testResult,
  ) async {
    loader = true;
    update();
    Map<String, dynamic> map = {
      'id': id,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'marital': marital,
      'chief_complain': chiefComplain,
      'prev_disease': prevDisease,
      'ot_history': otHistory,
      'medication': medication,
      'disabilities': disabilities,
      'test_result': testResult,
      'user_id': '${_myBox.get('userId')}'
    };
    kLogger.e(map);
    final FormData formData = FormData.fromMap(map);
    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.healthProfile, formData);
    loader = false;
    update();
    if (res.statusCode == 200) {
      PopupDialog.showSuccessDialog("Health profile Process Success");
    } else if (res.statusCode == 422) {
      PopupDialog.showErrorMessage("All field is required");
    }

    // Map body = {
    //   'id': id,
    //   'age': age,
    //   'gender': gender,
    //   'height': height,
    //   'weight': weight,
    //   'marital': marital,
    //   'chief_complain': chiefComplain,
    //   'prev_disease': prevDisease,
    //   'ot_history': otHistory,
    //   'medication': medication,
    //   'disabilities': disabilities,
    //   'test_result': testResult,
    //   'user_id': '${_myBox.get('userId')}',
    // };
    // String jsonBody = json.encode(body);
    // print(jsonBody);
    // Logger log = Logger();
    // var res = await server.postRequestWithToken(
    //   endPoint: Endpoints.healthProfile, body: jsonBody,

    //     .then((response) {
    //   print(json.decode(response.body));
    //   if (response != null && response.statusCode == 200) {
    //     final jsonResponse = json.decode(response.body);
    //     print(jsonResponse);
    //     var addHealthProfileData =
    //         AddHealthProfileResponseModel.fromJson(jsonResponse);
    //     healthProfileId = addHealthProfileData.data!.id;
    //     _myBox.put('healthProfileId', addHealthProfileData.data!.id.toString());
    //     loader = false;
    //     Future.delayed(const Duration(milliseconds: 10), () {
    //       update();
    //     });
    //     Get.rawSnackbar(message: 'Updated!', backgroundColor: Colors.green);
    //   } else {
    //     loader = false;
    //     Future.delayed(const Duration(milliseconds: 10), () {
    //       update();
    //     });
    //     Get.rawSnackbar(
    //         message: 'Please enter valid input', backgroundColor: Colors.red);
    //   }
    // }
    // );
    // log.e(res);
  }

  showHealthProfile() async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {'user_id': '${_myBox.get('userId')}'};
    String jsonBody = json.encode(body);

    server
        .postRequestWithToken(
            endPoint: Endpoints.getHealthProfile, body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);
        var getHealthProfileData = GetHealthProfileModel.fromJson(jsonResponse);
        age = getHealthProfileData.data!.age;
        gender = getHealthProfileData.data!.gender;
        height = getHealthProfileData.data!.height;
        weight = getHealthProfileData.data!.weight;
        marital = getHealthProfileData.data!.marital;
        chiefComplain = getHealthProfileData.data!.chiefComplain;
        prevDisease = getHealthProfileData.data!.prevDisease;
        otHistory = getHealthProfileData.data!.otHistory;
        medication = getHealthProfileData.data!.medication;
        disabilities = getHealthProfileData.data!.disabilities;
        testResult = getHealthProfileData.data!.testResult;
        _myBox.put('healthId', getHealthProfileData.data!.id.toString());
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
