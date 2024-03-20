import 'package:cureways_user/data/network/controllers/get_tmp_list_controller.dart';
import 'package:cureways_user/data/network/controllers/store_body_tmp_controller.dart';
import 'package:cureways_user/screens/health_tracker/body/widgets/today_added_body_temparature_list.dart';
import 'package:cureways_user/utils/my_func.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';

class BodyTemparatureScreen extends StatefulWidget {
  const BodyTemparatureScreen({Key? key}) : super(key: key);

  @override
  State<BodyTemparatureScreen> createState() => _BodyTemparatureScreenState();
}

class _BodyTemparatureScreenState extends State<BodyTemparatureScreen> {
  final _formKey = GlobalKey<FormState>();
  StoreBodyTmpController storeBodyTmpController = StoreBodyTmpController();
  GetTmpListController getTmpListController = GetTmpListController();

  @override
  void didChangeDependencies() {
    storeBodyTmpController = Get.put(StoreBodyTmpController());
    getTmpListController = Get.put(GetTmpListController());
    getTmpListController.getTmpList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreBodyTmpController>(
      init: StoreBodyTmpController(),
      builder: (storeBodyTmp) => Scaffold(
        appBar: CustomAppBar(title: Text("Body Temperature".toUpperCase())),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppDefaultBar(
            //     title: "BODY TEMPERATURE", userNAme: _myBox.get('userName')),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: storeBodyTmp.dateController,
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                labelText: 'yyyy-mm-dd',
                                hintText: 'yyyy-mm-dd',
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    storeBodyTmp.dateController.text =
                                        DateFormat("yyyy-MM-dd")
                                            .format(pickedDate);
                                    storeBodyTmp.update();
                                  }
                                }),
                            CustomTextField(
                              controller: storeBodyTmp.timeController,
                              keyboardType: TextInputType.text,
                              readOnly: true,
                              labelText: 'Enter Time Period',
                              hintText: 'Enter Time Period',
                              onTap: () async {
                                TimeOfDay? selectedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );
                                if (selectedTime != null) {
                                  storeBodyTmp.timeController.text =
                                      "${selectedTime.hour}:${selectedTime.minute}";
                                  //! formet the time
                                   MyFunc.formatTimeOfDay(selectedTime);
                                  storeBodyTmp.update();
                                }
                              },
                            ),
                            CustomTextField(
                              controller:
                                  storeBodyTmp.bodyTemperatureController,
                              suffix: const Text("Fahrenheit"),
                              keyboardType: TextInputType.number,
                              labelText: 'Enter BodyTemperature',
                              hintText: 'Enter BodyTemperature',
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9\.\-\/]'))
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      width: double.maxFinite,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          storeBodyTmp.storeBodyTmp();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: ConstantsColor.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: storeBodyTmp.loader
                            ? const Center(child: LoadIndecator())
                            : const Text(
                                'SUBMIT',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TodayAddedBodyTemparatureList(),
                    const Text(
                      'Age and average body temperature',
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Your “normal” body temperature changes throughout your life. It often rises from childhood into adulthood before dipping during the later years of life. By stages, it looks like this:',
                      style: TextStyle(
                          color: ConstantsColor.greyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'For younger children',
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'The typical body temperature range for children between birth and 10 years old goes from 95.9 F (35.5 C) to 99.5 F (37.5 C). This would be a temperature measured through an oral reading.',
                      style: TextStyle(
                          color: ConstantsColor.greyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'For adults and older children',
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'The typical body temperature range for people ages 11 to 65 is 97.6 F (36.4 C) to 99.6 F (37.6 C).',
                      style: TextStyle(
                          color: ConstantsColor.greyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'For older adults',
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'The typical body temperature range for people older than 65 is 96.4 F (35.8 C) to 98.5 F (36.9 C).',
                      style: TextStyle(
                          color: ConstantsColor.greyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
