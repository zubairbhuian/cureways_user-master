import 'package:cureways_user/data/network/controllers/get_weight_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WeightListScreen extends StatefulWidget {
  const WeightListScreen({super.key});

  @override
  State<WeightListScreen> createState() => _WeightListScreenState();
}

class _WeightListScreenState extends State<WeightListScreen> {
  GetWeightListController getWeightListController = GetWeightListController();

  @override
  void didChangeDependencies() {
    getWeightListController = Get.put(GetWeightListController());
    getWeightListController.getWeightList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ConstantsColor.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0)),
        ),
        title: const Text(
          "Weight List",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<GetWeightListController>(
        init: GetWeightListController(),
        builder: (weightList) => weightList.loader
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding:  EdgeInsets.all(20.w),
                child: ListView.builder(
                  itemCount: weightList.weightList.length,
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
                                "Body Weight: ${weightList.weightList[index].weight}"),
                            const SizedBox(height: 3),
                            Text("Date: ${weightList.weightList[index].date}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
