import 'dart:convert';

import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/blood_bank_search_response_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/screens/user_screens/blood_bank_screens/blood_bank_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodBankSearchController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  List<BloodBankSearch> bloodBankList = <BloodBankSearch>[];

  getSearchedBloodBankList(
    BuildContext context,
    String? districtId,
    String? policeStationId,
    String? areaId,
    String? bloodGroup,
    String? rhFactor,
  ) async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    Map body = {
      'division_id': districtId,
      'police_station_id': policeStationId,
      'area_id': areaId,
      'blood_group': bloodGroup,
      'rh_fector': rhFactor
    };
    String jsonBody = json.encode(body);

    server
        .postR(
            endPoint: "https://cureways.vaccinehomebd.com/api/bloodbank-search",
            body: jsonBody)
        .then((response) {
      print(json.decode(response.body));
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        var bloodBankSearchData =
            BloodBankSearchResponseModel.fromJson(jsonResponse);

        bloodBankList = <BloodBankSearch>[];
        bloodBankList.addAll(bloodBankSearchData.data!.bloodBankSearch!);

        loader = false;
        Future.delayed(const Duration(seconds: 5), () {
          update();
        });

        Get.off(() => BloodBankListScreen(bloodBankList: bloodBankList));
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(
            message: 'Input All required Information',
            backgroundColor: Colors.red);
      }
    });
  }
}
