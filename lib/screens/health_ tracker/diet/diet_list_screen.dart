import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/screens/health_%20tracker/diet/diet_list_details.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/style.dart';
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
      appBar: CustomAppBar(title: Text("Diet List".toUpperCase())),
      // appBar: AppBar(
      //   // automaticallyImplyLeading: false,
      //   leading: IconButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back_ios_new,
      //         color: kWhite,
      //       )),
      //   backgroundColor: ConstantsColor.primaryColor,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(12.0),
      //         bottomRight: Radius.circular(12.0)),
      //   ),
      //   title: const Text(
      //     "Diet List",
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      // ),
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
              padding: EdgeInsets.all(20.w),
              child: ListView.builder(
                itemCount: controlller.uniqueList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() =>  DietListDetails(data: controlller.uniqueList[index].date??""));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ConstantsColor.backgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Date: ${controlller.uniqueList[index].date}",
                              style: kLabelLarge,
                            ),
                            const SizedBox(height: 3),
                          ],
                        ),
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
