import 'dart:io';

import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/controllers/profile_controller.dart';
import 'package:cureways_user/data/network/models/vaccine_model.dart';
import 'package:cureways_user/utils/my_image_picker.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/popup_dialogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

import '../models/base/base_model.dart';

class VaccineRequestController extends GetxController {
  bool loader = false;
  File? imgFile;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  String? selecetedVaccine;

  List<VaccineModel> vaccineList = [];

  getVaccineList() async {
    try {
      var res = await BaseController.to.apiService
          .makeGetRequest("${Endpoints.server}${Endpoints.vaccineList}");
      if (res.statusCode == 200) {
        if (res.data["data"].isNotEmpty) {
          vaccineList = (res.data["data"] as List)
              .map((item) => VaccineModel.fromJson(item))
              .toList();
          update();
        }
      }
    } catch (e) {
      kLogger.e(e);
    }
  }

  // ******* pick and crop img
  onPickImage() async {
    imgFile = await MyImagePicker.pickImageAndCrop();
    update();
  }

  makeVaccineRequest() async {
    if (phoneController.text.length == 11) {
      if (imgFile != null) {
        try {
          loader = true;
          update();

          Map<String, dynamic> data = {
            'name': nameController.text,
            'phone': phoneController.text,
            'email': emailController.text,
            'upload_prescription ': await MultipartFile.fromFile(
              imgFile!.path,
            ),
            'reference': referenceController.text,
            'choose_vaccine': selecetedVaccine,
          };
          kLogger.i(data);
          final FormData formData = FormData.fromMap(data);
          update();
          PopupDialog.showLoadingDialog();
          BaseModel res = await BaseController.to.apiService
              .makePostRequestWithFormData(
                  Endpoints.server + Endpoints.vaccineOrder, formData);
          PopupDialog.closeLoadingDialog();
          loader = false;
          update();
          if (res.statusCode == 200) {
            nameController.clear();
            emailController.clear();
            phoneController.clear();
            referenceController.clear();
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
        PopupDialog.showErrorMessage("prescription image is required");
      }
    } else {
      PopupDialog.showErrorMessage("enter a valid phone number");
    }
  }
}
