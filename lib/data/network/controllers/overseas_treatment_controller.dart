import 'dart:io';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/popup_dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

class OverseasTreatmentController extends GetxController {
  final otformKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(text: "zubair");
  final TextEditingController phoneController = TextEditingController(text: "01732665086");
  final TextEditingController emailController = TextEditingController(text: "demo@gmail.com");
  final TextEditingController uhidController = TextEditingController(text: "demo");
  final TextEditingController selecetedServiceType = TextEditingController();

  /// 
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController totalPassengersController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();

  File? imgFile;
  File? imgFile2;
  File? imgFile3;
  File? imgFile4;

  List serviceTypeList = [
    'VIL(Visa Invitation Letter',
    'Doctor Appointment',
    'Airport Pickup',
    'SMO(Second Medical Opinion) ',
    'Telemedicine'
  ];
  makeOverseasTreatmentRequest() async {
    if (imgFile != null) {
      try {
        update();

        Map<String, dynamic> data = {
          'name': nameController.text,
          'phone': phoneController.text,
          'email': emailController.text,
          // 'uhid': uhidController.text,
          'type': selecetedServiceType.text,
          'passport_copy': await MultipartFile.fromFile(
            imgFile!.path,
          ),
        };
        final FormData formData = FormData.fromMap(data);
        update();
        PopupDialog.showLoadingDialog();
        BaseModel res = await BaseController.to.apiService
            .makePostRequestWithFormData('https://cureways.webbysys.click/api/v1/overseas-treatment', formData);
        PopupDialog.closeLoadingDialog();
        update();
        if (res.statusCode == 200) {
          nameController.clear();
          emailController.clear();
          phoneController.clear();
          uhidController.clear();
          imgFile = null;
          update();
          PopupDialog.showSuccessDialog("Request Success");
        } else if (res.statusCode == 422) {
          PopupDialog.showErrorMessage("All field is required");
        }
      } catch (e) {
        PopupDialog.closeLoadingDialog();
        kLogger.e(e);
      }
    } else {
      PopupDialog.showErrorMessage("Patient Passport is required");
    }
  }
}
