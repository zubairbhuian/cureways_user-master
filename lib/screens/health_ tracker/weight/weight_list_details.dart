import 'package:cureways_user/data/network/controllers/get_weight_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightListDetails extends GetView<GetWeightListController> {
  final String data;
  const WeightListDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(GetWeightListController()).onFilteredList(data);
    return Scaffold(
      appBar: CustomAppBar(title: Text(data)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: GetBuilder<GetWeightListController>(builder: (controller) {
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
                    Text(
                      "Date: ${controller.filteredList[index].date}",
                      style: kBodyLarge,
                    ),
                    4.height,
                    //   Text(
                    //   "Time: ${controller.filteredList[index].time}",
                    //   style: kBodyLarge,
                    // ),
                     4.height,
                      Text(
                      "Weight: ${controller.filteredList[index].weight}",
                      style: kBodyLarge,
                    ),
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
