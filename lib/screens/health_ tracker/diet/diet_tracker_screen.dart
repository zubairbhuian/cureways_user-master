import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/data/network/controllers/store_diet_controller.dart';
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
import 'widgets/today_added_diet_list.dart';

class DietTrackerScreen extends StatefulWidget {
  const DietTrackerScreen({Key? key}) : super(key: key);

  @override
  State<DietTrackerScreen> createState() => _DietTrackerScreenState();
}

class _DietTrackerScreenState extends State<DietTrackerScreen> {
  final _formKey = GlobalKey<FormState>();
  StoreDietController storeDietController = StoreDietController();
  GetDietListController getDietListController = GetDietListController();
 //DateFormat('DD-MM-yyyy').format(DateTime.now());

  @override
  void didChangeDependencies() {
    storeDietController = Get.put(StoreDietController());
    getDietListController = Get.put(GetDietListController());
    getDietListController.getDietList();
    super.didChangeDependencies();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("DIET TRACKER"),
      ),
      body: Container(
        height: double.infinity,
        color: ConstantsColor.backgroundColor,
        child: Column(
          children: [
            // AppDefaultBar(
            //     title: "DIET TRACKER", userNAme: _myBox.get('userName')),
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
                                  controller: storeDietController.dateController,
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
                                      storeDietController.dateController.text =
                                          DateFormat("yyyy-MM-dd")
                                              .format(pickedDate);
                                      storeDietController.update();
                                    }
                                  }),
                              CustomTextField(
                                controller: storeDietController.timePeriodController,
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
                                    storeDietController.timePeriodController.text =
                                        "${selectedTime.hour}:${selectedTime.minute}";
                                    //! formet the time
                                    /// MyFunc.formatTimeOfDay(selectedTime);
                                    storeDietController.update();
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              DropdownButtonFormField2(
                                value: storeDietController.foodTypeController.text.isEmpty
                                    ? null
                                    : storeDietController.foodTypeController.text,
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
                                      "Select Food Type",
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
                                    .foodQuantity
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
                                  storeDietController.foodTypeController.text =
                                      value.toString();
                                  // selectTimePeriod = value.toString();
                                },
                                onSaved: (value) {
                                  storeDietController.foodTypeController.text =
                                      value.toString();
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please Select Food Type';
                                  }
                                  return null;
                                },
                              ),
                              16.height,
                              CustomTextField(
                                controller: storeDietController.foodInCaloriesController,
                                keyboardType: TextInputType.number,
                                suffix: const Text("Calories"),
                                labelText: 'Food Quantity In Calories',
                                hintText: 'Food Quantity In Calories',
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
                      GetBuilder<StoreDietController>(
                        builder: (storeDietController) {
                          return SizedBox(
                            width: double.maxFinite,
                            height: 52,
                            child: OutlinedButton(
                              onPressed: () {
                                storeDietController.storeDiet();
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
                        }
                      ),

                      //. ======== today diet list ====
                      const SizedBox(
                        height: 16,
                      ),
                      const TodayAddedDietList(),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'A healthy lifestyle',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'To ensure a healthy lifestyle, WHO recommends eating lots of fruits and vegetables, reducing fat, sugar and salt intake and exercising. Based on height and weight, people can check their body mass index (BMI) to see if they are overweight. WHO provides a series of publications to promote and support healthy lifestyles.',
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
                        '12 steps to healthy eating',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        '1.Eat a nutritious diet based on a variety of foods originating mainly from plants, rather than animals',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '2.Eat bread, whole grains, pasta, rice or potatoes several times per day.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '3.Eat a variety of vegetables and fruits, preferably fresh and local, several times per day (at least 400g per day).',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '4.Maintain body weight between the recommended limits (a BMI of 18.5–25) by taking moderate to vigorous levels of physical activity, preferably daily.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '5.Control fat intake (not more than 30% of daily energy) and replace most saturated fats with unsaturated fats.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '6.Replace fatty meat and meat products with beans, legumes, lentils, fish, poultry or lean meat.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '7.Use milk and dairy products (kefir, sour milk, yoghurt and cheese) that are low in both fat and salt.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '8.Select foods that are low in sugar, and eat free sugars sparingly, limiting the frequency of sugary drinks and sweets.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '9.Choose a low-salt diet. Total salt intake should not be more than one teaspoon (5g) per day, including the salt in bread and processed, cured and preserved foods. (Salt iodization should be universal where iodine deficiency is a problem)',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '10.WHO does not set particular limits for alcohol consumption because the evidence shows that the ideal solution for health is not to drink at all, therefore less is better.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '11.Prepare food in a safe and hygienic way. Steam, bake, boil or microwave to help reduce the amount of added fat.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '12.Promote exclusive breastfeeding up to 6 months, and the introduction of safe and adequate complementary foods from the age of about 6 months. Promote the continuation of breastfeeding during the first 2 years of life.',
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
    );
  }
}
