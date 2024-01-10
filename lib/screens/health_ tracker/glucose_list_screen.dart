import 'package:cureways_user/data/network/controllers/get_glucose_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GlucoseListScreen extends StatefulWidget {
  const GlucoseListScreen({super.key});

  @override
  State<GlucoseListScreen> createState() => _GlucoseListScreenState();
}

class _GlucoseListScreenState extends State<GlucoseListScreen> {
  GetGlucoseListController getGlucoseListController =
      GetGlucoseListController();

  @override
  void didChangeDependencies() {
    getGlucoseListController = Get.put(GetGlucoseListController());
    getGlucoseListController.getGlucoseList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: Text("Glucose List".toUpperCase())),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: ConstantsColor.primaryColor,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(12.0),
      //         bottomRight: Radius.circular(12.0)),
      //   ),
      //   title: const Text(
      //     "Glucose List",
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      // ),
      body: GetBuilder<GetGlucoseListController>(
        init: GetGlucoseListController(),
        builder: (glucoseList) => glucoseList.loader
            ? const Center(child: AppIndecator())
            : Padding(
                padding:  EdgeInsets.all(20.w),
                child: ListView.builder(
                  itemCount: glucoseList.glucoseList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ConstantsColor.backgroundColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Date: ${glucoseList.glucoseList[index].date}"),
                                  Text(
                                "Glucose level: ${glucoseList.glucoseList[index].testResult}"),
                            const SizedBox(height: 3),
                            Text(
                                "Time of testing: ${glucoseList.glucoseList[index].timePeriodName}"),
                           
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
