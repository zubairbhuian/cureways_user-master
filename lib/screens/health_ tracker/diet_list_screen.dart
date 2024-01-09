import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DietListScreen extends StatefulWidget {
  const DietListScreen({super.key});

  @override
  State<DietListScreen> createState() => _DietListScreenState();
}

class _DietListScreenState extends State<DietListScreen> {
  GetDietListController getDietListController = GetDietListController();

  @override
  void didChangeDependencies() {
    getDietListController = Get.put(GetDietListController());
    getDietListController.getDietList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("This is ")),
      body: GetBuilder<GetDietListController>(
          init: GetDietListController(),
          builder: (controlller) {
            if (controlller.dietList == null) {
              return const Center(child: AppIndecator());
            }
            if (controlller.dietList!.isEmpty) {
              return const Center(
                  child: Text(
                "No Data Found",
                style: TextStyle(color: kDisabledTextColor),
              ));
            }
            return Padding(
              padding:  EdgeInsets.all(20.w),
              child: ListView.builder(
                itemCount: controlller.dietList?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: ConstantsColor.backgroundColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Food quantity: ${controlller.dietList?[index].foodQty}"),
                          const SizedBox(height: 3),
                          Text("Date: ${controlller.dietList?[index].date}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
