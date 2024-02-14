import 'package:cureways_user/data/network/controllers/overseas_treatment_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/my_image_picker.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:cureways_user/widgets/img_upload_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OverseasTreatmentDocScreen extends StatefulWidget {
  final String? title;
  const OverseasTreatmentDocScreen({super.key, this.title});

  @override
  State<OverseasTreatmentDocScreen> createState() =>
      _OverseasTreatmentDocScreenState();
}

class _OverseasTreatmentDocScreenState
    extends State<OverseasTreatmentDocScreen> {
  OverseasTreatmentController otcontroller = OverseasTreatmentController();

  @override
  void didChangeDependencies() {
    otcontroller = Get.put(OverseasTreatmentController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // ! ==== VIL(Visa Invitation Letter ====
    if (otcontroller.selecetedServiceType == "VIL(Visa Invitation Letter)") {
      return Scaffold(
        appBar: CustomAppBar(title: Text(widget.title??"")),
        body: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 22),
          child: Column(
            children: [
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile = null;
                    otcontroller.imgFile =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Patient Passport",
                );
              }),
              16.height,
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile2 == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile2 =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Attendant 1 Passport",
                );
              }),
              16.height,
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile3 == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile3 =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Attendant 2 Passport",
                );
              }),
              16.height,
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile4 == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile4 =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Attendant 3 Passport",
                );
              }),
              26.height,
              SizedBox(
                  width: double.infinity,
                  child: PrimaryBtn(
                      child: const Text("Send"),
                      onPressed: () {
                        otcontroller.makeOverseasTreatmentRequest();
                      }))
            ],
          ),
        ),
      );
      // ! ==== Airport Pickup ====
    } else if (otcontroller.selecetedServiceType == "Airport Pickup") {
      return Scaffold(
        appBar:CustomAppBar(title: Text(widget.title??"")),
        body: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 22),
          child: Column(
            children: [
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile = null;
                    otcontroller.imgFile =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Patient Passport",
                );
              }),
              16.height,
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile2 == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile2 = null;
                    otcontroller.imgFile2 =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Ticket Upload",
                );
              }),
              16.height,
              CustomTextField2(
                controller: otcontroller.totalPassengersController,
                hintText: "Total Passengers",
                keyboardType: TextInputType.number,
              ),
              CustomTextField2(
                controller: otcontroller.hospitalNameController,
                hintText: "Airport Name",
              ),
              CustomTextField2(
                  controller: otcontroller.dateController,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  hintText: 'Arrival Date',
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      otcontroller.dateController.text =
                          DateFormat("yyyy-MM-dd").format(pickedDate);
                      otcontroller.update();
                    }
                  }),
              CustomTextField2(
                controller: otcontroller.timeController,
                keyboardType: TextInputType.text,
                readOnly: true,
                hintText: 'Arrival Time',
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  if (selectedTime != null) {
                    otcontroller.timeController.text =
                        "${selectedTime.hour}:${selectedTime.minute}";
                    //! formet the time
                    /// MyFunc.formatTimeOfDay(selectedTime);
                    otcontroller.update();
                  }
                },
              ),
              26.height,
              SizedBox(
                  width: double.infinity,
                  child: PrimaryBtn(
                      child: const Text("Send"),
                      onPressed: () {
                        otcontroller.makeOverseasTreatmentRequest();
                      }))
            ],
          ),
        ),
      );
      // ! ==== Others ====
    } else {
      return Scaffold(
        appBar: CustomAppBar(title: Text(widget.title??"")),
        body: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 22),
          child: Column(
            children: [
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile = null;
                    otcontroller.imgFile =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Passport Copy",
                );
              }),
              16.height,
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile2 == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile2 = null;
                    otcontroller.imgFile2 =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Previous Report",
                );
              }),
              16.height,
              GetBuilder<OverseasTreatmentController>(builder: (otcontroller) {
                return ImgUploadBtn(
                  color: otcontroller.imgFile3 == null ? null : kSuccessColor,
                  onTap: () async {
                    otcontroller.imgFile3 = null;
                    otcontroller.imgFile3 =
                        await MyImagePicker.pickImageAndCrop();
                    otcontroller.update();
                  },
                  text: "Previous Prescription",
                );
              }),
              16.height,
              26.height,
              SizedBox(
                  width: double.infinity,
                  child: PrimaryBtn(
                      child: const Text("Send"),
                      onPressed: () {
                        otcontroller.makeOverseasTreatmentRequest();
                      }))
            ],
          ),
        ),
      );
    }
  }
}
