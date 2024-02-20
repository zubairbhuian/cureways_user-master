import 'package:cureways_user/data/network/controllers/reports_controller.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/mixins.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';
import 'widgets/today_added_reports_list.dart';

class ReportsTrackerScreen extends StatefulWidget {
  const ReportsTrackerScreen({Key? key}) : super(key: key);

  @override
  State<ReportsTrackerScreen> createState() => _ReportsTrackerScreenState();
}

class _ReportsTrackerScreenState extends State<ReportsTrackerScreen> {
  final _formKey = GlobalKey<FormState>();
  ReportsController reportsController = ReportsController();

  @override
  void didChangeDependencies() {
    reportsController = Get.put(ReportsController());
    reportsController.getReportList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("REPORT TRACKER"),
      ),
      body: Container(
        height: double.infinity,
        color: ConstantsColor.backgroundColor,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                  controller: reportsController.dateController,
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
                                      reportsController.dateController.text =
                                          DateFormat("yyyy-MM-dd")
                                              .format(pickedDate);
                                      reportsController.update();
                                    }
                                  }),
                              CustomTextField(
                                controller:
                                    reportsController.timePeriodController,
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
                                    reportsController
                                            .timePeriodController.text =
                                        "${selectedTime.hour}:${selectedTime.minute}";
                                    //! formet the time
                                    /// MyFunc.formatTimeOfDay(selectedTime);
                                    reportsController.update();
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              DropdownButtonFormField2(
                                value: reportsController.selectedTestName,
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
                                      "Select Test Type",
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
                                    .testNameList
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
                                  reportsController.selectedTestName = value;
                                  // selectTimePeriod = value.toString();
                                },
                                onSaved: (value) {
                                  reportsController.selectedTestName =
                                      value.toString();
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please Select test type';
                                  }
                                  return null;
                                },
                              ),
                              16.height,
                              CustomTextField(
                                controller: reportsController.resultController,
                                keyboardType: TextInputType.number,
                                // suffix: const Text("Result"),
                                labelText: 'Result',
                                hintText: 'Result',
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                // onChanged: (value){
                                //   storeDiet.foodInCaloriesController.text = '$value KG ';
                                // },
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      GetBuilder<ReportsController>(
                          builder: (storeDietController) {
                        return SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              storeDietController.storeReports();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: ConstantsColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: storeDietController.loader
                                ? const Center(child: LoadIndecator())
                                : const Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                          ),
                        );
                      }),

                      //. ======== today diet list ====
                      const SizedBox(
                        height: 16,
                      ),
                      const TodayAddedReportsList(),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Sr.Creatinine',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "A normal result is 0.7 to 1.3 mg/dL (61.9 to 114.9 µmol/L) for men and 0.6 to 1.1 mg/dL (53 to 97.2 µmol/L) for women. Women often have a lower blood creatinine level than men. This is because women often have less muscle mass than men. Creatinine level varies based on a person's size and muscle mass.",
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Sr.Uric Acid',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'By this approach, serum uric acid values between 3.5 and 7.2 mg/dL in adult males and postmenopausal women and between 2.6 and 6.0 mg/dL in premenopausal women have been identified as normal in many countries.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // new para
                      const Text(
                        'TSH',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'TSH normal values are 0.5 to 5.0 mIU/L. Some people with a TSH value over 2.0 mIU/L, who have no signs or symptoms suggestive of an under-active thyroid, may develop hypothyroidism sometime in the future. Anyone with a TSH above 2.0 mIU/L, therefore, should be followed very closely by a doctor.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      16.height,
                      // new para
                      const Text(
                        'CBC',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Male: 4.35 trillion to 5.65 trillion cells/L Female: 3.92 trillion to 5.13 trillion cells/L',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      16.height,
                      // new para
                      const Text(
                        'SGPT',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'The SGPT or Serum Glutamate Pyruvate Transaminase is one of the enzymes found in the liver. The normal range of SGPT is 7 to 56 units per liter of blood serum. High levels of enzymes in the liver can be a serious indication of diseases or damage.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      24.height
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
