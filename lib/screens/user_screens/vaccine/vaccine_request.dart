import 'package:cureways_user/data/network/controllers/vaccine_request_controller.dart';
import 'package:cureways_user/utils/const_color.dart';

import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:cureways_user/widgets/img_upload_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaccineRequestScreen extends StatefulWidget {
  const VaccineRequestScreen({super.key});

  @override
  State<VaccineRequestScreen> createState() => _VaccineRequestScreenState();
}

class _VaccineRequestScreenState extends State<VaccineRequestScreen> {
  VaccineRequestController vaccineController = VaccineRequestController();

  @override
  void didChangeDependencies() {
    vaccineController = Get.put(VaccineRequestController());
    vaccineController.getVaccineList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Vaccine Request"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField2(
              hintText: 'Name',
              controller: vaccineController.nameController,
              keyboardType: TextInputType.name,
            ),
            CustomTextField2(
              hintText: 'Phone Number',
              controller: vaccineController.phoneController,
              keyboardType: TextInputType.number,
            ),
            CustomTextField2(
              hintText: 'Email',
              controller: vaccineController.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            GetBuilder<VaccineRequestController>(builder: (controller) {
              var data = controller.vaccineList;
              return CustomDropdownTextFiel(
                hint: const Text("Choose Vaccine"),
                  items: List.generate(
                      data.length,
                      (index) => DropdownMenuItem<String>(
                            value: data[index].name,
                            child: Text(
                              data[index].name,
                              style: kBodyLarge,
                            ),
                          )),
                  onChanged: (String? value) {
                    controller.selecetedVaccine = value!;
                    kLogger.e(controller.selecetedVaccine);
                  });
            }),
            16.height,
            CustomTextField2(
              hintText: 'Reference',
              controller: vaccineController.referenceController,
              keyboardType: TextInputType.emailAddress,
            ),
            GetBuilder<VaccineRequestController>(
              builder: (controller) {
                return ImgUploadBtn(
                  color:controller.imgFile==null?null: kSuccessColor,
                  text: "Upload Prescription",
                  onTap: () {
                    vaccineController.onPickImage();
                  },
                );
              }
            ),
            26.height,
            SizedBox(
                width: double.infinity,
                child: PrimaryBtn(
                    child: const Text("Submit"),
                    onPressed: () {
                      vaccineController.makeVaccineRequest();
                    }))
          ],
        ),
      ),
    
    );
  }
}
