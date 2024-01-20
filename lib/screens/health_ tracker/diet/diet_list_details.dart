import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietListDetails extends GetView<GetDietListController> {
  final String data;
  const DietListDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(GetDietListController()).onFilteredList(data);
    return Scaffold(
      appBar: CustomAppBar(title: Text(data)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: GetBuilder<GetDietListController>(
          builder: (controller) {
          if (controller.todayFilteredList.isEmpty) {
            return const Center(
              child: AppIndecator(),
            );
          }
          return Column(
            children: List.generate(controller.todayFilteredList.length, (index) {
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
                      "Date: ${controller.todayFilteredList[index].date}",
                      style: kBodyLarge,
                    ),
                    4.height,
                      Text(
                      "Time: ${controller.todayFilteredList[index].time}",
                      style: kBodyLarge,
                    ),
                     4.height,
                      Text(
                      "Food Quality: ${controller.todayFilteredList[index].foodQty}",
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
