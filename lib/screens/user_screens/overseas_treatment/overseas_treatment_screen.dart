import 'package:cureways_user/data/network/controllers/overseas_treatment_controller.dart';
import 'package:cureways_user/screens/user_screens/overseas_treatment/pages/overseas_treatment_doc_screen.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:cureways_user/widgets/img_upload_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/style.dart';

class OverseasTreatmentScreen extends StatefulWidget {
  const OverseasTreatmentScreen({super.key});

  @override
  State<OverseasTreatmentScreen> createState() =>
      _OverseasTreatmentScreenState();
}

class _OverseasTreatmentScreenState extends State<OverseasTreatmentScreen> {
  OverseasTreatmentController otcontroller = OverseasTreatmentController();

  @override
  void didChangeDependencies() {
    otcontroller = Get.put(OverseasTreatmentController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Overseas Treatment"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Form(
          key: otcontroller.otformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField2(
                hintText: 'Name',
                controller: otcontroller.nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              CustomTextField2(
                hintText: 'Phone Number',
                controller: otcontroller.phoneController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 11) {
                    return 'Please enter your valid number';
                  }
                  return null;
                },
              ),
              CustomTextField2(
                hintText: 'Email',
                controller: otcontroller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your valid email';
                  }
                  return null;
                },
              ),
              CustomTextField2(
                hintText: 'UHID(If Available)',
                controller: otcontroller.uhidController,
                keyboardType: TextInputType.emailAddress,
              ),
              GetBuilder<OverseasTreatmentController>(builder: (controller) {
                var data = controller.serviceTypeList;
                return CustomDropdownTextFiel(
                  hint: const Text("Service Type"),
                  items: List.generate(
                      data.length,
                      (index) => DropdownMenuItem<String>(
                            value: data[index],
                            child: Text(
                              data[index],
                              style: kBodyLarge,
                            ),
                          )),
                  onChanged: (String? value) {
                    controller.selecetedServiceType.text = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please selecet one';
                    }
                    return null;
                  },
                );
              }),
              26.height,
              SizedBox(
                  width: double.infinity,
                  child: PrimaryBtn(
                      child: const Text("Next"),
                      onPressed: () {
                        if (otcontroller.otformKey.currentState!.validate()) {
                          Get.to(() => const OverseasTreatmentDocScreen());
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
