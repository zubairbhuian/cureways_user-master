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
import 'package:get/get.dart';

class AddHealthProfileScreen extends StatefulWidget {
  final String userName;
  const AddHealthProfileScreen({super.key, required this.userName});

  @override
  State<AddHealthProfileScreen> createState() => _AddHealthProfileScreenState();
}

class _AddHealthProfileScreenState extends State<AddHealthProfileScreen> {
  AddHealthProfileController addHealthProfileController =
      AddHealthProfileController();

  final _formKey = GlobalKey<FormState>();
  dynamic userName;
  bool _isExpanded = false;

  @override
  void initState() {
    userName = widget.userName;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    addHealthProfileController = Get.put(AddHealthProfileController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Add Health Profile")),
      // appBar: AppBar(
      //   toolbarHeight: 152,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: ConstantsColor.primaryColor,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(12.0),
      //         bottomRight: Radius.circular(12.0)),
      //   ),
      //   title: Column(
      //     children: [
      //       //SizedBox(height: 42,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Expanded(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "Hi,$userName",
      //                   textAlign: TextAlign.start,
      //                   style: const TextStyle(
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.w600,
      //                       color: Colors.white),
      //                 ),
      //                 const Text(
      //                   "Welcome back",
      //                   textAlign: TextAlign.start,
      //                   style: TextStyle(
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.w400,
      //                       color: Colors.white),
      //                 )
      //               ],
      //             ),
      //           ),
      //           SvgPicture.asset(
      //             "assets/home_screen/bell.svg",
      //             height: 32,
      //             width: 32,
      //             color: Colors.white,
      //           )
      //         ],
      //       ),
      //       const SizedBox(height: 16),
      //       const Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'ADD HEALTH PROFILE',
      //             textAlign: TextAlign.start,
      //             style: TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w600,
      //                 color: Colors.white),
      //           )
      //         ],
      //       )
      //     ],
      //   ),
      // ),
     
      body: GetBuilder<AddHealthProfileController>(
        init: AddHealthProfileController(),
        builder: (addHealthProfile) => SingleChildScrollView(
          child: Padding(
           padding:  EdgeInsets.only(left: 20.w, right: 20.w,bottom: 12),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  "Keep track of your health record",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ConstantsColor.primaryColor),
                ),
                const SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: addHealthProfile.ageController,
                        keyboardType: TextInputType.text,
                          labelText: 'Age',
                          hintText: 'Age',
                        validator: (value) {
                          return value!.isEmpty ? 'Enter Your Age' : null;
                        },
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
                                    padding:
                                        EdgeInsets.only(left: 00, right: 10),
                                  ),
                                  isExpanded: true,
                                  hint: const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    addHealthProfile.genderController.text= value.toString();
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
                                12.height,
            
                      CustomTextField(
                        suffix: const Text("cm"),
                        controller: addHealthProfile.heightController,
                        keyboardType: TextInputType.text,
                                             labelText: 'Height',
                          hintText: 'Height',
  
                        validator: (value) {
                          return value!.isEmpty ? 'Enter Your Height' : null;
                        },
                      ),
   
                      CustomTextField(
                        suffix: const Text("kg"),
                        controller: addHealthProfile.weightController,
                        keyboardType: TextInputType.text,
                                          labelText: 'Weight',
                          hintText: 'Weight',

                        validator: (value) {
                          return value!.isEmpty ? 'Enter Your Weight' : null;
                        },
                      ),
                        DropdownButtonFormField2(
                          // value: Mixins().mutualStatus.first,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  buttonStyleData: const ButtonStyleData(
                                    height: 60,
                                    padding:
                                        EdgeInsets.only(left: 00, right: 10),
                                  ),
                                  isExpanded: true,
                                  hint: const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Select Marital Status",
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
                                      .mutualStatus
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
                                    addHealthProfile.msController.text= value.toString();
                                  },
                                  // onSaved: (value) {
                                  //   storeGlucose.timePeriodController.text = value.toString();
                                  // },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select Marital Status';
                                    }
                                    return null;
                                  },
                                ),
                                12.height,
 
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: CustomTextField(
                          controller: addHealthProfile.chiefComplainController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: _isExpanded ? null : 3,
                                                 labelText: 'Chief Complain',
                            hintText: 'Chief Complain(If Any)',
    
                        ),
                      ),
                      CustomTextField(
                        controller: addHealthProfile.prevDiseaseController,
                        keyboardType: TextInputType.text,
                                           labelText: 'Previous Disease',
                          hintText: 'Previous Disease(If Any)',
               
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: addHealthProfile.prevOtHistoryController,
                        keyboardType: TextInputType.text,
                                      labelText: 'Ot History',
                          hintText: 'Ot History(If Any)',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: addHealthProfile.medicationController,
                        keyboardType: TextInputType.text,
                                              labelText: 'Medication',
                          hintText: 'Medication(If Any)',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller:
                            addHealthProfile.physicalDisabilitiesController,
                        keyboardType: TextInputType.text,
                                          labelText: 'Disabilities',
                          hintText: 'Disabilities(If Any)',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: addHealthProfile.prevTestResultController,
                        keyboardType: TextInputType.text,
                                              labelText: 'Test Result',
                          hintText: 'Test Result(If Any)',

                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: OutlinedButton(
                    onPressed: () {
                      addHealthProfile.addHealthProfile(
                        context,
                        '',
                        addHealthProfile.ageController.text.toString().trim(),
                        addHealthProfile.genderController.text == 'Male'
                            ? '1'
                            : '2',
                        addHealthProfile.heightController.text
                            .toString()
                            .trim(),
                        addHealthProfile.weightController.text
                            .toString()
                            .trim(),
                        addHealthProfile.msController.text.toString().trim(),
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
                        addHealthProfile.physicalDisabilitiesController.text
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
                    child: addHealthProfile.loader == true
                        ? const Center(child: LoadIndecator())
                        : const Text(
                            ' Save Health Profile ',
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
