import 'package:cureways_user/data/network/controllers/get_bp_list_controller.dart';
import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/data/network/controllers/get_glucose_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlucoseListDetails extends GetView<GetGlucoseListController> {
  final String data;
  const GlucoseListDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(GetGlucoseListController()).onFilteredList(data);
    return Scaffold(
      appBar: CustomAppBar(title: Text(data)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: GetBuilder<GetGlucoseListController>(builder: (controller) {
          if (controller.filteredList.isEmpty) {
            return const Center(
              child: AppIndecator(),
            );
          }
          return Column(
            children: List.generate(controller.filteredList.length, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: ConstantsColor.backgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text("Date: ${controller.glucoseList[index].date}"),
                    Text(
                        "Time of testing: ${controller.glucoseList[index].timePeriod}"),
                    const SizedBox(height: 3),
                    Text(
                        "Time Period Name: ${controller.glucoseList[index].timePeriodName}"),
                    Text(
                        "Glucose level: ${controller.glucoseList[index].testResult}"),
                  ],
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
