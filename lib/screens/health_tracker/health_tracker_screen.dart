import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/health_data_model.dart';
import 'package:cureways_user/screens/health_tracker/body/body_temparature_screen.dart';
import 'package:cureways_user/screens/health_tracker/bp/bp_list_screen.dart';
import 'package:cureways_user/screens/health_tracker/bp/bp_tracker.dart';
import 'package:cureways_user/screens/health_tracker/diet/diet_tracker_screen.dart';
import 'package:cureways_user/screens/health_tracker/glucose/glucose_tracker_screen.dart';
import 'package:cureways_user/screens/health_tracker/reports/reports_list_screen.dart';
import 'package:cureways_user/screens/health_tracker/reports/reports_tracker_screen.dart';
import 'package:cureways_user/screens/health_tracker/weight/weight_list_screen.dart';
import 'package:cureways_user/screens/health_tracker/weight/weight_tracker_screen.dart';
import 'package:cureways_user/screens/health_tracker/widgets/custom_circular_percent_indicator.dart';
import 'package:cureways_user/utils/Int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/const_color.dart';
import 'body/body_list_screen.dart';
import 'diet/diet_list_screen.dart';
import 'glucose/glucose_list_screen.dart';
import 'widgets/health_tracker_card.dart';

class HealthTrackerScreen extends StatefulWidget {
  final String? userName;
  const HealthTrackerScreen({Key? key, this.userName}) : super(key: key);

  @override
  State<HealthTrackerScreen> createState() => _HealthTrackerScreenState();
}

class _HealthTrackerScreenState extends State<HealthTrackerScreen> {
  final _myBox = Hive.box('userBox');

  String dietPercentage = '0.0';
  String bpPercentage = '0.0';
  String bodyTempPercentage = '0.0';
  String weightPercentage = '0.0';
  String glucosePercentage = '0.0';
  String reportPercentage = '0.0';
  List<HealthDataModel> dietList = [];
  List<HealthDataModel> bpList = [];
  List<HealthDataModel> bodyTempList = [];
  List<HealthDataModel> weightList = [];
  List<HealthDataModel> glucoseList = [];
  List<HealthDataModel> reportList = [];
  // getHealthData() async {
  //   try {
  //     var res = await BaseController.to.apiService.makeGetRequest(
  //         'https://cureways.webbysys.click/api/v1/last-seven-day-health-tracker/${_myBox.get('userId')}');

  //     if (res.statusCode == 200) {
  //       // add Percentage data
  //       dietPercentage = res.data['dietPercentage'];
  //       bpPercentage = res.data['bpPercentage'];
  //       bodyTempPercentage = res.data['dietPercentage'];
  //       weightPercentage = res.data['weightPercentage'];
  //       glucosePercentage = res.data['glucosePercentage'];
  //       reportPercentage = res.data['ReportPercentage'];

  //       // add diet data
  //       dietList = (res.data['diet'] as List)
  //           .map((item) => HealthDataModel.fromJson(item))
  //           .toList();
  //       // add bp data
  //       bpList = (res.data['bp'] as List)
  //           .map((item) => HealthDataModel.fromJson(item))
  //           .toList();
  //       // add bodyTemp data
  //       bodyTempList = (res.data['bodyTemp'] as List)
  //           .map((item) => HealthDataModel.fromJson(item))
  //           .toList();
  //       // add weight data
  //       weightList = (res.data['weight'] as List)
  //           .map((item) => HealthDataModel.fromJson(item))
  //           .toList();
  //       // add diet data
  //       glucoseList = (res.data['glucose'] as List)
  //           .map((item) => HealthDataModel.fromJson(item))
  //           .toList();
  //       reportList = (res.data['report'] as List)
  //           .map((item) => HealthDataModel.fromJson(item))
  //           .toList();
  //           setState(() {

  //           });
  //     }

  //     // setState(() {});

  //     kLogger.e(res.data);
  //   } catch (e) {
  //     kLogger.e('Error from %%%% Health Tracker %%%% => $e');
  //   }
  // }

  //for carousel slider
  final List<String> foodTimeName = ['BreakFast', 'Lunch', 'Dinner'];
  final List<String> fTime = ['8.00 AM', '2.00 PM', '8.00 PM'];
  dynamic userName;

  @override
  void initState() {
    // getHealthData();
    userName = widget.userName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getHealthData();
    return Scaffold(
      backgroundColor: ConstantsColor.backgroundColor,
      appBar: const CustomAppBar(
        title: Text("HEALTH TRACKER"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: ConstantsColor.backgroundColor,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: kPrimaryColor,
                      //       borderRadius: BorderRadius.circular(10)),
                      //   height: 125,
                      //   width: double.maxFinite,
                      //   child: const Center(
                      //       child: Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "OVERALL PROGRESS",
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w700),
                      //             ),
                      //             SizedBox(
                      //               height: 2,
                      //             ),
                      //             Text(
                      //               "LAST 7 DAYS",
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.w400),
                      //             )
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   )),
                      // ),
                      // const SizedBox(
                      //   height: 16,
                      // ),

                      // Row(
                      //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(10)),
                      //       height: 100,
                      //       width: 90,
                      //       child: const Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             "BP",
                      //             style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.bold,
                      //               color: ConstantsColor.greyColor,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //           SizedBox(
                      //             height: 4,
                      //           ),
                      //           Text(
                      //             "120/80",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.black),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     const Spacer(),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(10)),
                      //       height: 100,
                      //       width: 120,
                      //       child: const Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             "Body\nTemperature",
                      //             style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.bold,
                      //               color: ConstantsColor.greyColor,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //           SizedBox(
                      //             height: 4,
                      //           ),
                      //           Text(
                      //             "101° F",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.black),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     const Spacer(),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(10)),
                      //       height: 100,
                      //       width: 90,
                      //       child: const Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             "Glucose",
                      //             style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.bold,
                      //               color: ConstantsColor.greyColor,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //           SizedBox(
                      //             height: 4,
                      //           ),
                      //           Text(
                      //             "130 mg/dl",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.black),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10)),
                      //   height: 100,
                      //   width: 90,
                      //   child: const Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "Weight",
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold,
                      //           color: ConstantsColor.greyColor,
                      //         ),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //       SizedBox(
                      //         height: 4,
                      //       ),
                      //       Text(
                      //         "78",
                      //         style: TextStyle(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.black),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // 20.height,
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      HealthTrackerCard(
                        title: 'DIET TRACKER',
                        onAdd: () {
                          Get.to(() => const DietTrackerScreen());
                        },
                         onList: () {
                          Get.to(() => const DietListScreen());
                        },
                      ),
                      // ! BP Row
                        HealthTrackerCard(
                        title: 'BP TRACKER',
                        onAdd: () {
                          Get.to(() => const BpTrackerScreen());
                        },
                         onList: () {
                          Get.to(() => const BpListScreen());
                        },
                      ),
                      // ! GLUCOSE Row
                        HealthTrackerCard(
                        title: 'GLUCOSE TRACKER',
                        onAdd: () {
                          Get.to(() => const GlucoseTrackerScreen());
                        },
                         onList: () {
                          Get.to(() => const GlucoseListScreen());
                        },
                      ),
                      // ! BODY TEMPERATURE
                       HealthTrackerCard(
                        title: 'BODY TEMPERATURE',
                        onAdd: () {
                          Get.to(() => const BodyTemparatureScreen());
                        },
                         onList: () {
                          Get.to(() => const BodyListScreen());
                        },
                      ),
                      //! WEIGHT row
                        HealthTrackerCard(
                        title: 'WEIGHT TRACKER',
                        onAdd: () {
                          Get.to(() => const WeightTrackerScreen());
                        },
                         onList: () {
                          Get.to(() => const WeightListScreen());
                        },
                      ),
                       /// ! REPORTS tracker
                         HealthTrackerCard(
                        title: 'REPORTS TRACKER',
                        onAdd: () {
                          Get.to(() => const ReportsTrackerScreen());
                        },
                         onList: () {
                          Get.to(() => const ReportsListScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
