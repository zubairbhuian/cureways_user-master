import 'package:cureways_user/data/network/controllers/get_bp_list_controller.dart';
import 'package:cureways_user/data/network/controllers/store-bp_controller.dart';
import 'package:cureways_user/screens/health_%20tracker/bp/widgets/today_added_bp_list.dart';
import 'package:cureways_user/screens/health_%20tracker/health_tracker_screen.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/my_func.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BpTrackerScreen extends StatefulWidget {
  const BpTrackerScreen({Key? key}) : super(key: key);

  @override
  State<BpTrackerScreen> createState() => _BpTrackerScreenState();
}

class _BpTrackerScreenState extends State<BpTrackerScreen> {
  final _formKey = GlobalKey<FormState>();

  StoreBpController storeBpController = StoreBpController();
  GetBpListController getBpController = GetBpListController();

  @override
  void didChangeDependencies() {
    storeBpController = Get.put(StoreBpController());
    getBpController = Get.put(GetBpListController());
    getBpController.getBpList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreBpController>(
      init: StoreBpController(),
      builder: (storeBp) => Scaffold(
        appBar: const CustomAppBar(title: Text("BP TRACKER")),
        body: Container(
          height: double.infinity,
          color: ConstantsColor.backgroundColor,
          child: Column(
            children: [
              // AppDefaultBar(
              //     title: "BP TRACKER", userNAme: _myBox.get('userName')),
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
                                    controller: storeBp.dateController,
                                    keyboardType: TextInputType.text,
                                    readOnly: true,
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
                                        storeBp
                                            .dateController.text = DateFormat("yyyy-MM-dd")
                                            .format(pickedDate);
                                        storeBp.update();
                                      }
                                    }),
                                CustomTextField(
                                  controller: storeBp.timeController,
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
                                      storeBp.timeController.text =
                                          "${selectedTime.hour}:${selectedTime.minute}";
                                      //! formet the time
                                      //  MyFunc.formatTimeOfDay(selectedTime);
                                   
                                    }
                                  },
                                ),
                                CustomTextField(
                                  controller: storeBp.systolicBpController,
                                  keyboardType: TextInputType.number,
                                  suffix: const Text("mmHg"),
                                  labelText: 'Enter Systolic Value',
                                  hintText: 'Enter Systolic Value',
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9\.\-\/]'))
                                  ],
                                ),
                                CustomTextField(
                                  controller: storeBp.diastolicBpController,
                                  keyboardType: TextInputType.number,
                                  suffix: const Text("mmHg"),
                                  labelText: 'Enter Diastolic Value',
                                  hintText: 'Enter Diastolic Value',
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9\.\-\/]'))
                                  ],
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              storeBp.storeBp();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: ConstantsColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: storeBp.loader
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
                        const TodayAddedBPList(),
                        const Text(
                          'Blood pressure categories',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'The five blood pressure (BP) ranges as recognized by the American Heart Association are:',
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
                          'Normal',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Blood pressure numbers of less than 120/80 mm Hg are considered within the normal range. If your results fall into this category, stick with heart-healthy habits like following a balanced diet and getting regular exercise',
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
                          'Elevated',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Elevated blood pressure is when readings consistently range from 120-129 systolic and less than 80 mm Hg diastolic. People with elevated blood pressure are likely to develop high blood pressure unless steps are taken to control the condition.',
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
                          'Hypertension Stage 1',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Hypertension Stage 1 is when blood pressure consistently ranges from 130-139 systolic or 80-89 mm Hg diastolic. At this stage of high blood pressure, doctors are likely to prescribe lifestyle changes and may consider adding blood pressure medication based on your risk of atherosclerotic cardiovascular disease (ASCVD), such as heart attack or stroke.',
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
                          'Hypertension Stage 2',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Hypertension Stage 2 is when blood pressure consistently ranges at 140/90 mm Hg or higher. At this stage of high blood pressure, doctors are likely to prescribe a combination of blood pressure medications and lifestyle changes.',
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
                          'Hypertensive crisis',
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'This stage of high blood pressure requires medical attention. If your blood pressure readings suddenly exceed 180/120 mm Hg, wait five minutes and then test your blood pressure again. If your readings are still unusually high, contact your doctor immediately. You could be experiencing a hypertensive crisis.',
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
