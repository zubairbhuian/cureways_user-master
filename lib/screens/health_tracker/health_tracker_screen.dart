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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/const_color.dart';
import 'body/body_list_screen.dart';
import 'diet/diet_list_screen.dart';
import 'glucose/glucose_list_screen.dart';

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
                      const Text(
                        "DIET TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // !Diet row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // top progress bar
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: kPrimaryColor,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 100,
                          //   width: 80,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       // progress bar
                          //       CustomCircularPercentIndicator(dietPercentage),
                          //       3.height,
                          //       const Text(
                          //         "7 DAYS",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 10,
                          //             fontWeight: FontWeight.w700),
                          //       )
                          //     ],
                          //   ),
                          // ),

                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DietTrackerScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 14), // x, y offset
                                      blurRadius: 34,
                                      spreadRadius: 0,
                                      color: Color.fromARGB(255, 234, 241,
                                          253), // Replace with your desired color
                                    ),
                                  ]),
                              height: 100,
                              width: 80,
                              child: Center(
                                child: Icon(
                                  Icons.add_circle_sharp,
                                  size: 36.sp,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const DietListScreen());
                            },
                            child: Container(
                             decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 14), // x, y offset
                                      blurRadius: 34,
                                      spreadRadius: 0,
                                      color: Color.fromARGB(255, 234, 241,
                                          253), // Replace with your desired color
                                    ),
                                  ]),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Text(
                                  "See\nList",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<HealthDataModel, int>(
                      //         dataSource: dietList,
                      //         xValueMapper: (HealthDataModel data, _) => _ + 1,
                      //         yValueMapper: (HealthDataModel data, _) =>
                      //             data.y1Value,
                      //         pointColorMapper: (HealthDataModel data, _) =>
                      //             data.y1color,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 24,
                      ),
                      // ! BP Row
                      const Text(
                        "BP TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          // top progress bar
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: kPrimaryColor,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 100,
                          //   width: 80,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       // progress bar
                          //       CustomCircularPercentIndicator(bpPercentage),
                          //       3.height,
                          //       const Text(
                          //         "7 DAYS",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 10,
                          //             fontWeight: FontWeight.w700),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BpTrackerScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Image(
                                  image: AssetImage(
                                      "assets/health_tracker/plus-circle.png"),
                                  height: 52,
                                  width: 52,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const BpListScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Text(
                                  "See\nList",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<HealthDataModel, int>(
                      //           dataSource: bpList,
                      //           xValueMapper: (HealthDataModel data, _) =>
                      //               _ + 1,
                      //           yValueMapper: (HealthDataModel data, _) =>
                      //               data.y1Value,
                      //           pointColorMapper: (HealthDataModel data, _) =>
                      //               data.y1color),
                      //       LineSeries<HealthDataModel, int>(
                      //           dataSource: bpList,
                      //           xValueMapper: (HealthDataModel data, _) =>
                      //               _ + 1,
                      //           yValueMapper: (HealthDataModel data, _) =>
                      //               data.y2Value,
                      //           pointColorMapper: (HealthDataModel data, _) =>
                      //               data.y2color)
                      //     ],
                      //   ),
                      // ),
                      // ! GLUCOSE Row
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "GLUCOSE TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          // top progress bar
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: kPrimaryColor,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 100,
                          //   width: 80,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       // progress bar
                          //       CustomCircularPercentIndicator(
                          //           glucosePercentage),
                          //       3.height,
                          //       const Text(
                          //         "7 DAYS",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 10,
                          //             fontWeight: FontWeight.w700),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GlucoseTrackerScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Image(
                                  image: AssetImage(
                                      "assets/health_tracker/plus-circle.png"),
                                  height: 52,
                                  width: 52,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const GlucoseListScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Text(
                                  "See\nList",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<HealthDataModel, int>(
                      //         dataSource: glucoseList,
                      //         xValueMapper: (HealthDataModel data, _) => _ + 1,
                      //         yValueMapper: (HealthDataModel data, _) =>
                      //             data.y1Value,
                      //         pointColorMapper: (HealthDataModel data, _) =>
                      //             data.y1color,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // ! BODY TEMPERATURE
                      const Text(
                        "BODY TEMPERATURE",
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          // top progress bar
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: kPrimaryColor,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 100,
                          //   width: 80,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       // progress bar
                          //       CustomCircularPercentIndicator(
                          //           bodyTempPercentage),
                          //       3.height,
                          //       const Text(
                          //         "7 DAYS",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 10,
                          //             fontWeight: FontWeight.w700),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BodyTemparatureScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Image(
                                  image: AssetImage(
                                      "assets/health_tracker/plus-circle.png"),
                                  height: 52,
                                  width: 52,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const BodyListScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Text(
                                  "See\nList",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<HealthDataModel, double>(
                      //         dataSource: bodyTempList,
                      //         xValueMapper: (HealthDataModel data, _) => _ + 1,
                      //         yValueMapper: (HealthDataModel data, _) =>
                      //             data.y1Value,
                      //         pointColorMapper: (HealthDataModel data, _) =>
                      //             data.y1color,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 16,
                      ),
                      // ! WEIGHT row
                      const Text(
                        "WEIGHT TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          // top progress bar
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: kPrimaryColor,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 100,
                          //   width: 80,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       // progress bar
                          //       CustomCircularPercentIndicator(
                          //           weightPercentage),
                          //       3.height,
                          //       const Text(
                          //         "7 DAYS",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 10,
                          //             fontWeight: FontWeight.w700),
                          //       )
                          //     ],
                          //   ),
                          // ),

                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WeightTrackerScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Image(
                                  image: AssetImage(
                                      "assets/health_tracker/plus-circle.png"),
                                  height: 52,
                                  width: 52,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const WeightListScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Text(
                                  "See\nList",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<HealthDataModel, int>(
                      //         dataSource: weightList,
                      //         xValueMapper: (HealthDataModel data, _) => _ + 1,
                      //         yValueMapper: (HealthDataModel data, _) =>
                      //             data.y1Value,
                      //         // pointColorMapper: (HealthDataModel data, _) =>
                      //         //     data.y1color,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 16,
                      ),

                      /// ! REPORTS tracker
                      const Text(
                        "REPORTS TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          // top progress bar
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: kPrimaryColor,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: 100,
                          //   width: 80,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       // progress bar
                          //       CustomCircularPercentIndicator(
                          //           reportPercentage),
                          //       3.height,
                          //       const Text(
                          //         "7 DAYS",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 10,
                          //             fontWeight: FontWeight.w700),
                          //       )
                          //     ],
                          //   ),
                          // ),

                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ReportsTrackerScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Image(
                                  image: AssetImage(
                                      "assets/health_tracker/plus-circle.png"),
                                  height: 52,
                                  width: 52,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const ReportsListScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 80,
                              child: const Center(
                                child: Text(
                                  "See\nList",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<HealthDataModel, int>(
                      //         dataSource: reportList,
                      //         xValueMapper: (HealthDataModel data, _) => _ + 1,
                      //         yValueMapper: (HealthDataModel data, _) =>
                      //             data.y1Value,
                      //         // pointColorMapper: (HealthDataModel data, _) =>
                      //         //     data.y1color,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 26,
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
