import 'dart:io';

import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/popup_dialogs.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

class OverseasTreatmentController extends GetxController {
  final otformKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController uhidController = TextEditingController();
  String? selecetedServiceType;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final TextEditingController flightDetailsController = TextEditingController();
  final TextEditingController totalPassengersController =
      TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();

  File? imgFile;
  File? imgFile2;
  File? imgFile3;
  File? imgFile4;

  List<MultipartFile> patientPassportList = [];

  List serviceTypeList = [
    'VIL(Visa Invitation Letter)',
    'Doctor Appointment',
    'Airport Pickup',
    'SMO(Second Medical Opinion) ',
    'Telemedicine'
  ];

  void openPPFileSelector() async {
    patientPassportList = [];
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      for (var file in files) {
        // Create MultipartFile from File object
        patientPassportList.add(
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last, // Extract file name from path
          ),
        );
      }
      update();
    } else {
      // User canceled the picker
    }
     update();
  }

  makeOverseasTreatmentRequest() async {
    if (patientPassportList.isNotEmpty ) {
      try {
        update();
        Map<String, dynamic> data = {
          'name': nameController.text,
          'phone': phoneController.text,
          'email': emailController.text,
          'uhid': uhidController.text,
          'type': selecetedServiceType,
          'passport_copy':patientPassportList,
          // //
          'previous_report': imgFile2 == null
              ? null
              : await MultipartFile.fromFile(
                  imgFile2!.path,
                ),
          'previous_prescription': imgFile3 == null
              ? null
              : await MultipartFile.fromFile(
                  imgFile3!.path,
                ),
          'ticket_upload': imgFile4 == null
              ? null
              : await MultipartFile.fromFile(
                  imgFile4!.path,
                ),
          'total_passengers': totalPassengersController.text,
          'hostpital_name': hospitalNameController.text,
          'arrival_date': dateController.text,
          'departure_date': departureDateController.text,
          'flight_details': flightDetailsController
        };
        final FormData formData = FormData.fromMap(data);
        update();
        PopupDialog.showLoadingDialog();
        BaseModel res = await BaseController.to.apiService
            .makePostRequestWithFormData(
                'https://cureways.webbysys.click/api/v1/overseas-treatment',
                formData);
        PopupDialog.closeLoadingDialog();
        update();
        if (res.statusCode == 200) {
          Get.back();
          nameController.clear();
          emailController.clear();
          phoneController.clear();
          uhidController.clear();
          selecetedServiceType = null;
          dateController.clear();
          departureDateController.clear();
          totalPassengersController.clear();
          hospitalNameController.clear();
          imgFile = null;
          imgFile2 = null;
          imgFile3 = null;
          imgFile4 = null;
          update();
          PopupDialog.showSuccessDialog("Request Success");
        } else if (res.statusCode == 422) {
          PopupDialog.showErrorMessage("All field is required");
        }
      } catch (e) {
        // PopupDialog.closeLoadingDialog();
        kLogger.e(e);
      }
    } else {
      PopupDialog.showErrorMessage("Patient Passport is required");
    }
  }
}
