import 'package:cureways_user/data/network/controllers/get_glucose_list_controller.dart';
import 'package:cureways_user/data/network/controllers/store_glucose_controller.dart';
import 'package:cureways_user/screens/health_tracker/glucose/widgets/today_added_glucose_list.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/const_color.dart';
import '../../../utils/mixins.dart';
import '../../../widgets/appbar.dart';

class GlucoseTrackerScreen extends StatefulWidget {
  const GlucoseTrackerScreen({Key? key}) : super(key: key);

  @override
  State<GlucoseTrackerScreen> createState() => _GlucoseTrackerScreenState();
}

class _GlucoseTrackerScreenState extends State<GlucoseTrackerScreen> {
  StoreGlucoseController storeGlucoseController = StoreGlucoseController();
  GetGlucoseListController glucoseListController = GetGlucoseListController();

  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    storeGlucoseController = Get.put(StoreGlucoseController());
    glucoseListController = Get.put(GetGlucoseListController());
    glucoseListController.getGlucoseList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreGlucoseController>(
      init: StoreGlucoseController(),
      builder: (storeGlucose) => Scaffold(
        appBar: CustomAppBar(title: Text("Glucose TRACKER".toUpperCase())),
        body: Container(
          color: ConstantsColor.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12),
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                    controller: storeGlucose.dateController,
                                    keyboardType: TextInputType.text,
                                    labelText: 'yyyy-mm-dd',
                                    hintText: 'yyyy-mm-dd',
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2101));
                                      if (pickedDate != null) {
                                        storeGlucose
                                            .dateController.text = DateFormat("yyyy-MM-dd")
                                            .format(pickedDate);
                                        storeGlucose.update();
                                      }
                                    }),
                                CustomTextField(
                                  controller: storeGlucose.timeController,
                                  keyboardType: TextInputType.text,
                                  readOnly: true,
                                  labelText: 'Enter Time Period',
                                  hintText: 'Enter Time Period',
                                  onTap: () async {
                                    TimeOfDay? selectedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (selectedTime != null) {
                                      storeGlucose.timeController.text =
                                          "${selectedTime.hour}:${selectedTime.minute}";
                                      //! formet the time
                                      /// MyFunc.formatTimeOfDay(selectedTime);
                                      storeGlucose.update();
                                    }
                                  },
                                ),
                                DropdownButtonFormField2(
                                  value: storeGlucose
                                          .timePeriodController.text.isEmpty
                                      ? null
                                      : storeGlucose.timePeriodController.text,
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
                                        "Select TimePeriod",
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
                                      .glucoseTestTimeperiod
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
                                    storeGlucose.timePeriodController.text =
                                        value.toString();
                                  },
                                  // onSaved: (value) {
                                  //   storeGlucose.timePeriodController.text = value.toString();
                                  // },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select TimePeriod';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomTextField(
                                  controller: storeGlucose.resultController,
                                  keyboardType: TextInputType.number,
                                  suffix: const Text("mmol/L"),
                                  labelText: 'Your Glucose Test Result',
                                  hintText: 'Your Glucose Test Result',
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9\.\-\/]'))
                                  ],
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              storeGlucose.storeGlucose();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: ConstantsColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: storeGlucose.loader
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
                        const TodayAddedGlucoseList(),
                        const Text(
                          'Normal and diabetic blood sugar ranges',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'For the majority of healthy individuals, normal blood sugar levels are as follows:',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Between 4.0 to 5.4 mmol/L (72 to 99 mg/dL) when fasting [361]',
                          style: TextStyle(
                              color: ConstantsColor.greyColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.start,
                        ),
                        const Text(
                          'Up to 7.8 mmol/L (140 mg/dL) 2 hours after eating',
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
                          'For people with diabetes, blood sugar level targets are as follows:',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.start,
                        ),
                        const Text(
                          'Before meals : 4 to 7 mmol/L for people with type 1 or type 2 diabetes',
                          style: TextStyle(
                              color: ConstantsColor.greyColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.start,
                        ),
                        const Text(
                          'After meals : under 9 mmol/L for people with type 1 diabetes and under 8.5mmol/L for people with type 2 diabetes',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
