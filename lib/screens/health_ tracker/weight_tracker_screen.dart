import 'package:cureways_user/data/network/controllers/store_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../utils/const_color.dart';
import '../../widgets/appbar.dart';
import 'health_tracker_screen.dart';

class WeightTrackerScreen extends StatefulWidget {
  const WeightTrackerScreen({Key? key}) : super(key: key);

  @override
  State<WeightTrackerScreen> createState() => _WeightTrackerScreenState();
}

class _WeightTrackerScreenState extends State<WeightTrackerScreen> {
  StoreWeightController storeWeightController = StoreWeightController();
  final _formKey = GlobalKey<FormState>();
  final _myBox = Hive.box('userBox');

  @override
  void didChangeDependencies() {
    storeWeightController = Get.put(StoreWeightController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreWeightController>(
      init: StoreWeightController(),
      builder: (storeWeight) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDefaultBar(
                title: "WEIGHT TRACKER", userNAme: _myBox.get('userName')),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: storeWeight.dateController,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 20),
                                    labelText: '  mm-dd-yyyy',
                                    hintText: '  mm-dd-yyyy',
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal),
                                    labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal),
                                    suffixIcon: Icon(Icons.calendar_month),
                                  ),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2010),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      storeWeight.dateController.text =
                                          DateFormat(
                                                  DateFormat.YEAR_NUM_MONTH_DAY)
                                              .format(pickedDate);
                                      storeWeight.update();
                                    }
                                  }),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: storeWeight.weightController,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 20),
                                  labelText: '    Enter Weight',
                                  hintText: '    Enter Weight',
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                  labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: OutlinedButton(
                          onPressed: () {
                            storeWeight.storeWeight(
                              context,
                              storeWeight.dateController.text.toString().trim(),
                              storeWeight.weightController.text
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
                          child: storeWeight.loader
                              ? const Center(child: CircularProgressIndicator())
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
                      const Text(
                        'Normal Weight Ranges: Body Mass Index (BMI)',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Underweight: ',
                            style: TextStyle(
                                color: ConstantsColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'BMI is less than 18.5 ',
                            style: TextStyle(
                                color: ConstantsColor.greyColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Normal weight: ',
                            style: TextStyle(
                                color: ConstantsColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'BMI is 18.5 to 24.9 ',
                            style: TextStyle(
                                color: ConstantsColor.greyColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Overweight:  ',
                            style: TextStyle(
                                color: ConstantsColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'BMI is 25 to 29.9 ',
                            style: TextStyle(
                                color: ConstantsColor.greyColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Obese: ',
                            style: TextStyle(
                                color: ConstantsColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'BMI is 30 or more',
                            style: TextStyle(
                                color: ConstantsColor.greyColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Text(
                        'Calculating my BMI',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'BMI = (your weight in pounds x 703) ÷ (your height in inches x your height in inches)For example,\nif you weigh 120 pounds and are 5 ft. 3 in. (63 in.) tall:\nBMI = (120 x 703) ÷ (63 x 63) or 84,360 ÷ 3969 = 21.3',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
