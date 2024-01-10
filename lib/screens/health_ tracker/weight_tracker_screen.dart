import 'package:cureways_user/data/network/controllers/store_weight_controller.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../utils/const_color.dart';
import '../../widgets/appbar.dart';

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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: storeWeight.dateController,
                                keyboardType: TextInputType.text,
                                labelText: 'mm/dd/yyyy',
                                hintText: 'mm/dd/yyyy',
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
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
                            CustomTextField(
                              controller: storeWeight.weightController,
                              keyboardType: TextInputType.text,
                              labelText: 'Enter Weight',
                              hintText: '80 KG',
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
                          storeWeight.storeWeight(
                            context,
                            storeWeight.dateController.text.toString().trim(),
                            storeWeight.weightController.text.toString().trim(),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: ConstantsColor.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: storeWeight.loader
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
            )
          ],
        ),
      ),
    );
  }
}
