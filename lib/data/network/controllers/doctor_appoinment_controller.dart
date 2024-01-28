import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/doctors_model.dart';
import 'package:cureways_user/data/network/models/specialist_model.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:get/get.dart';

class DoctorAppoinmentController extends GetxController {
  List<SpecialistModel> doctorSpecialist = [];
  List<DoctorModel>? doctorList;

  getSpeciaList() async {
    try {
      var res = await BaseController.to.apiService
          .makeGetRequest("${Endpoints.server}${Endpoints.doctorSpecialist}");
      if (res.statusCode == 200) {
        if (res.data["data"].isNotEmpty) {
          doctorSpecialist = (res.data["data"] as List)
              .map((item) => SpecialistModel.fromJson(item))
              .toList();
          update();
        }
      }
    } catch (e) {
      kLogger.e(e);
    }
  }

  getSpeciaListDoctors(String id) async {
    try {
      doctorList = null;
      update();
      var res = await BaseController.to.apiService.makeGetRequest(
          "https://cureways.webbysys.click/api/v1/specialist-doctors/$id");
      if (res.statusCode == 200) {
        if (res.data["data"].isNotEmpty) {
          doctorList = (res.data["data"] as List)
              .map((item) => DoctorModel.fromJson(item))
              .toList();
          update();
        } else {
          doctorList = [];
          update();
        }
      }
    } catch (e) {
      kLogger.e(e);
    }
  }
}
