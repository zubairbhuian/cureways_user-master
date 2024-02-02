import 'package:cureways_user/data/network/controllers/add_health_profile_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/mixins.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UpdateHealthProfileScreen extends StatefulWidget {
  const UpdateHealthProfileScreen({super.key});

  @override
  State<UpdateHealthProfileScreen> createState() =>
      _UpdateHealthProfileScreenState();
}

class _UpdateHealthProfileScreenState extends State<UpdateHealthProfileScreen> {
  bool _isExpanded = false;
  final _myBox = Hive.box('userBox');
  AddHealthProfileController addHealthProfileController =
      AddHealthProfileController();

  @override
  void didChangeDependencies() {
    addHealthProfileController = Get.put(AddHealthProfileController());
    addHealthProfileController.showHealthProfile();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddHealthProfileController>(
      init: AddHealthProfileController(),
      builder: (addHealthProfile) => Scaffold(
        appBar: const CustomAppBar(title: Text("Update Health Profile")),
        body: addHealthProfile.loader
            ? const Center(child: AppIndecator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 12),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        "Update your health record",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstantsColor.primaryColor),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          CustomTextField(
                            controller: addHealthProfile.ageController
                              ..text = addHealthProfile.age.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .ageController.text.length),
                            keyboardType: TextInputType.text,
                            labelText: 'Age',
                            hintText: 'Age',
                          ),
                          DropdownButtonFormField2(
                            // value: Mixins().patientGender.first,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            buttonStyleData: const ButtonStyleData(
                              height: 60,
                              padding: EdgeInsets.only(left: 00, right: 10),
                            ),
                            isExpanded: true,
                            hint: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Select Gender",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: ConstantsColor.primaryColor),
                                ),
                                Text(
                                  "*",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            items: Mixins()
                                .patientGender
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    )))
                                .toList(),
                            onChanged: (value) {
                              addHealthProfile.genderController.text =
                                  value.toString();
                            },
                            // onSaved: (value) {
                            //   storeGlucose.timePeriodController.text = value.toString();
                            // },
                            validator: (value) {
                              if (value == null) {
                                return 'Please Select Gender';
                              }
                              return null;
                            },
                          ),
                          16.height,
                          CustomTextField(
                            controller: addHealthProfile.genderController
                              ..text = addHealthProfile.gender == "1"
                                  ? "Male"
                                  : "Female",
                            keyboardType: TextInputType.text,
                            labelText: 'Gender',
                            hintText: 'Gender',
                          ),
                          CustomTextField(
                            controller: addHealthProfile.heightController
                              ..text = addHealthProfile.height.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .heightController.text.length),
                            keyboardType: TextInputType.text,
                            labelText: 'Height',
                            hintText: 'Height',
                          ),
                          CustomTextField(
                            controller: addHealthProfile.weightController
                              ..text = addHealthProfile.weight.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .weightController.text.length),
                            keyboardType: TextInputType.text,
                            labelText: 'Weight',
                            hintText: 'Weight',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: addHealthProfile.msController
                              ..text = addHealthProfile.marital.toString(),
                            keyboardType: TextInputType.text,
                            labelText: 'Marital Status',
                            hintText: 'Marital Status',
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: CustomTextField(
                              controller: addHealthProfile
                                  .chiefComplainController
                                ..text =
                                    addHealthProfile.chiefComplain.toString()
                                ..selection = TextSelection.collapsed(
                                    offset: addHealthProfile
                                        .chiefComplainController.text.length),
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: _isExpanded ? null : 3,
                              labelText: 'Chief Complain',
                              hintText: 'Chief Complain(If Any)',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: addHealthProfile.prevDiseaseController
                              ..text = addHealthProfile.prevDisease.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .prevDiseaseController.text.length),
                            keyboardType: TextInputType.text,
                            labelText: 'Previous Disease',
                            hintText: 'Previous Disease(If Any)',
                          ),
                          CustomTextField(
                            controller: addHealthProfile.prevOtHistoryController
                              ..text = addHealthProfile.otHistory.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .prevOtHistoryController.text.length),
                            keyboardType: TextInputType.text,
                            labelText: 'Ot History',
                            hintText: 'Ot History(If Any)',
                          ),
                          CustomTextField(
                            controller: addHealthProfile.medicationController
                              ..text = addHealthProfile.medication.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .medicationController.text.length),
                            keyboardType: TextInputType.text,
                            labelText: 'Medication',
                            hintText: 'Medication(If Any)',
                          ),
                          CustomTextField(
                            controller: addHealthProfile
                                .physicalDisabilitiesController
                              ..text = addHealthProfile.disabilities.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .physicalDisabilitiesController
                                      .text
                                      .length),
                            keyboardType: TextInputType.text,
                            labelText: 'Disabilities',
                            hintText: 'Disabilities(If Any)',
                          ),
                          CustomTextField(
                            controller: addHealthProfile
                                .prevTestResultController
                              ..text = addHealthProfile.testResult.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .prevTestResultController.text.length),
                            keyboardType: TextInputType.text,
                            labelText: 'Test Result',
                            hintText: 'Test Result(If Any)',
                          ),
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: OutlinedButton(
                          onPressed: () {
                            addHealthProfile.addHealthProfile(
                              context,
                              _myBox.get('healthId'),
                              addHealthProfile.ageController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile.genderController.text == 'Male'
                                  ? '1'
                                  : '2',
                              addHealthProfile.heightController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile.weightController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile.msController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile.chiefComplainController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile.prevDiseaseController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile.prevOtHistoryController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile.medicationController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile
                                  .physicalDisabilitiesController.text
                                  .toString()
                                  .trim(),
                              addHealthProfile.prevTestResultController.text
                                  .toString()
                                  .trim(),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: ConstantsColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            ' Update Health Profile ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
