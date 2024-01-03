import 'package:cureways_user/data/network/controllers/add_health_profile_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(
          toolbarHeight: 152,
          automaticallyImplyLeading: false,
          backgroundColor: ConstantsColor.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0)),
          ),
          title: Column(
            children: [
              //SizedBox(height: 42,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hi,${_myBox.get('userName')}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const Text(
                          "Welcome back",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/home_screen/bell.svg",
                    height: 32,
                    width: 32,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'UPDATE HEALTH PROFILE',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
        body: addHealthProfile.loader
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          TextFormField(
                            controller: addHealthProfile.ageController
                              ..text = addHealthProfile.age.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .ageController.text.length),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Age',
                              hintText: 'Age',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: addHealthProfile.genderController
                              ..text = addHealthProfile.gender == "1"
                                  ? "Male"
                                  : "Female",
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Gender',
                              hintText: 'Gender',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: addHealthProfile.heightController
                              ..text = addHealthProfile.height.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .heightController.text.length),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Height',
                              hintText: 'Height',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: addHealthProfile.weightController
                              ..text = addHealthProfile.weight.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .weightController.text.length),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Weight',
                              hintText: 'Weight',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: addHealthProfile.msController
                              ..text = addHealthProfile.marital.toString(),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Marital Status',
                              hintText: 'Marital Status',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: TextFormField(
                              controller:
                                  addHealthProfile.chiefComplainController
                                    ..text = addHealthProfile.chiefComplain.toString()
                                    ..selection = TextSelection.collapsed(
                                        offset: addHealthProfile
                                            .chiefComplainController
                                            .text
                                            .length),
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: _isExpanded ? null : 3,
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                labelText: 'Chief Complain',
                                hintText: 'Chief Complain(If Any)',
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: addHealthProfile.prevDiseaseController
                              ..text = addHealthProfile.prevDisease.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .prevDiseaseController.text.length),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Previous Disease',
                              hintText: 'Previous Disease(If Any)',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: addHealthProfile.prevOtHistoryController
                              ..text = addHealthProfile.otHistory.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .prevOtHistoryController.text.length),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Ot History',
                              hintText: 'Ot History(If Any)',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: addHealthProfile.medicationController
                              ..text = addHealthProfile.medication.toString()
                              ..selection = TextSelection.collapsed(
                                  offset: addHealthProfile
                                      .medicationController.text.length),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Medication',
                              hintText: 'Medication(If Any)',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller:
                                addHealthProfile.physicalDisabilitiesController
                                  ..text = addHealthProfile.disabilities.toString()
                                  ..selection = TextSelection.collapsed(
                                      offset: addHealthProfile
                                          .physicalDisabilitiesController
                                          .text
                                          .length),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Disabilities',
                              hintText: 'Disabilities(If Any)',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller:
                                addHealthProfile.prevTestResultController
                                  ..text = addHealthProfile.testResult.toString()
                                  ..selection = TextSelection.collapsed(
                                      offset: addHealthProfile
                                          .prevTestResultController
                                          .text
                                          .length),
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              labelText: 'Test Result',
                              hintText: 'Test Result(If Any)',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal),
                            ),
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
