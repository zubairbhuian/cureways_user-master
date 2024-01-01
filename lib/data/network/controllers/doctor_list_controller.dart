import 'dart:convert';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/models/doctor_list_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:get/get.dart';

class DoctorListController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  bool loader = false;
  List<DoctorData> doctorDataList = <DoctorData>[];

  getDoctorList() async {
    loader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });

    server
        .getRequestWithoutToken(endPoint: Endpoints.doctorList)
        .then((response) {
      print(response);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(jsonResponse);

        var doctorData = DoctorListModel.fromJson(jsonResponse);

        doctorDataList = <DoctorData>[];
        doctorDataList.addAll(doctorData.doctorDataList!);

        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'No data found');
      }
    });
  }
}
