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
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  final dataMap = <String, double>{
    "Progress": 80.00,
  };
  final dietMap = <String, double>{
    "Progress": 80.00,
  };
  final bpTracker = <String, double>{
    "Progress": 00.00,
  };
  final glucoseTracker = <String, double>{
    "Progress": 00.00,
  };
  final bodyTemperature = <String, double>{
    "Progress": 00.00,
  };

  final colorList = <Color>[
    Colors.white,
  ];
  //for carousel slider
  final List<String> foodTimeName = ['BreakFast', 'Lunch', 'Dinner'];
  final List<String> fTime = ['8.00 AM', '2.00 PM', '8.00 PM'];
  dynamic userName;

  @override
  void initState() {
    userName = widget.userName;
    getChartData();
    getMedData();
    getWeightTrackerData();
    getTemperatureTrackerData();
    getGlucoseTrackerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantsColor.backgroundColor,
      appBar: const CustomAppBar(
        title: Text("HEALTH TRACKER"),
      ),
      body: Column(
        children: [
          // AppDefaultBar(title: "HEALTH TRACKER", userNAme: "$userName"),
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
                      Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        height: 125,
                        width: double.maxFinite,
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "OVERALL PROGRESS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "LAST 7 DAYS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 90,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "BP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ConstantsColor.greyColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "120/80",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 120,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Body\nTemperature",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ConstantsColor.greyColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "101° F",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 90,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Glucose",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ConstantsColor.greyColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "130 mg/dl",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 100,
                        width: 90,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ConstantsColor.greyColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "78",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      20.height,
                      // ! =====  Graph  ======
                      SizedBox(
                        height: 232,
                        child: SfCartesianChart(
                          // primaryXAxis: CategoryAxis(),
                          // primaryYAxis: CategoryAxis(),
                          series: <ChartSeries>[
                            // Diet
                            LineSeries<HealTrackerData, double>(
                              dataSource: getChartData(),
                              xValueMapper: (HealTrackerData day, _) => day.day,
                              yValueMapper: (HealTrackerData day, _) =>
                                  day.mealInCalories,
                            ),
                            // bp
                            LineSeries<GlucoseTrackerData, double>(
                              yAxisName: "demo",
                              xAxisName: "sss",
                              dataSource: getGlucoseTrackerData(),
                              xValueMapper: (GlucoseTrackerData day, _) =>
                                  day.day,
                              yValueMapper: (GlucoseTrackerData day, _) =>
                                  day.glucose,
                            ),

                            // Glucose
                                         LineSeries<GlucoseTrackerData, double>(
                              dataSource: getGlucoseTrackerData(),
                              xValueMapper: (GlucoseTrackerData day, _) =>
                                  day.day,
                              yValueMapper: (GlucoseTrackerData day, _) =>
                                  day.glucose,
                            ),

                            LineSeries<MedicineTrackerData, double>(
                              dataSource: getMedData(),
                              xValueMapper: (MedicineTrackerData day, _) =>
                                  day.day,
                              yValueMapper: (MedicineTrackerData day, _) =>
                                  day.mealInCalories,
                            )
                            // Body
                            // Weight
                            // Report
                            //
                            //
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
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
                          Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // progress bar
                                const CustomCircularPercentIndicator("50"),
                                3.height,
                                const Text(
                                  "7 DAYS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
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
                              Get.to(() => const DietListScreen());
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
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<HealTrackerData, double>(
                      //         dataSource: getChartData(),
                      //         xValueMapper: (HealTrackerData day, _) => day.day,
                      //         yValueMapper: (HealTrackerData day, _) =>
                      //             day.mealInCalories,
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
                          Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // progress bar
                                const CustomCircularPercentIndicator("50"),
                                3.height,
                                const Text(
                                  "7 DAYS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
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
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<MedicineTrackerData, double>(
                      //         dataSource: getMedData(),
                      //         xValueMapper: (MedicineTrackerData day, _) =>
                      //             day.day,
                      //         yValueMapper: (MedicineTrackerData day, _) =>
                      //             day.mealInCalories,
                      //       )
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
                          Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // progress bar
                                const CustomCircularPercentIndicator("50"),
                                3.height,
                                const Text(
                                  "7 DAYS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
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
                      //       LineSeries<GlucoseTrackerData, double>(
                      //         dataSource: getGlucoseTrackerData(),
                      //         xValueMapper: (GlucoseTrackerData day, _) =>
                      //             day.day,
                      //         yValueMapper: (GlucoseTrackerData day, _) =>
                      //             day.glucose,
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
                          Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // progress bar
                                const CustomCircularPercentIndicator("50"),
                                3.height,
                                const Text(
                                  "7 DAYS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
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
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<TemperatureTrackerData, double>(
                      //         dataSource: getTemperatureTrackerData(),
                      //         xValueMapper: (TemperatureTrackerData day, _) =>
                      //             day.day,
                      //         yValueMapper: (TemperatureTrackerData day, _) =>
                      //             day.temp,
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
                          Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // progress bar
                                const CustomCircularPercentIndicator("50"),
                                3.height,
                                const Text(
                                  "7 DAYS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),

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
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<WeightTrackerData, double>(
                      //         dataSource: getWeightTrackerData(),
                      //         xValueMapper: (WeightTrackerData day, _) =>
                      //             day.day,
                      //         yValueMapper: (WeightTrackerData day, _) =>
                      //             day.weight,
                      //         pointColorMapper: (WeightTrackerData day, _) =>
                      //             day.pointColorMapper,
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
                          Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // progress bar
                                const CustomCircularPercentIndicator("50"),
                                3.height,
                                const Text(
                                  "7 DAYS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),

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
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // SizedBox(
                      //   height: 232,
                      //   child: SfCartesianChart(
                      //     series: <ChartSeries>[
                      //       LineSeries<WeightTrackerData, double>(
                      //         dataSource: getWeightTrackerData(),
                      //         xValueMapper: (WeightTrackerData day, _) =>
                      //             day.day,
                      //         yValueMapper: (WeightTrackerData day, _) =>
                      //             day.weight,
                      //         pointColorMapper: (WeightTrackerData day, _) =>
                      //             day.pointColorMapper,
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

  List<HealTrackerData> getChartData() {
    final List<HealTrackerData> chartData = [
      HealTrackerData(1, 10),
      HealTrackerData(2, 16),
      HealTrackerData(3, 14),
      HealTrackerData(4, 20),
      HealTrackerData(5, 7),
      HealTrackerData(6, 24),
      HealTrackerData(7, 12),
    ];
    return chartData;
  }

  List<MedicineTrackerData> getMedData() {
    final List<MedicineTrackerData> mediData = [
      MedicineTrackerData(1, 7),
      MedicineTrackerData(2, 3),
      MedicineTrackerData(3, 3),
      MedicineTrackerData(4, 3),
      MedicineTrackerData(5, 6),
      MedicineTrackerData(6, 23),
      MedicineTrackerData(7, 6),
    ];
    return mediData;
  }

  List<WeightTrackerData> getWeightTrackerData() {
    final List<WeightTrackerData> chartData = [
      WeightTrackerData(1, 80, const Color.fromRGBO(0, 0, 255, 1)),
      WeightTrackerData(2, 86, const Color.fromRGBO(255, 0, 0, 1)),
      WeightTrackerData(3, 86, const Color.fromRGBO(255, 0, 0, 1)),
      WeightTrackerData(4, 84, const Color.fromRGBO(255, 100, 102, 1)),
      WeightTrackerData(5, 78, const Color.fromRGBO(3, 220, 00, 1)),
      WeightTrackerData(6, 78, const Color.fromRGBO(3, 220, 102, 1)),
      WeightTrackerData(7, 80, const Color.fromRGBO(0, 0, 255, 1)),
    ];
    return chartData;
  }

  List<TemperatureTrackerData> getTemperatureTrackerData() {
    final List<TemperatureTrackerData> chartData = [
      TemperatureTrackerData(1, 98),
      TemperatureTrackerData(2, 98),
      TemperatureTrackerData(3, 96),
      TemperatureTrackerData(4, 96),
      TemperatureTrackerData(5, 99),
      TemperatureTrackerData(6, 98),
      TemperatureTrackerData(7, 96),
    ];
    return chartData;
  }

  List<GlucoseTrackerData> getGlucoseTrackerData() {
    final List<GlucoseTrackerData> chartData = [
      GlucoseTrackerData(1, 8),
      GlucoseTrackerData(2, 8),
      GlucoseTrackerData(3, 6),
      GlucoseTrackerData(4, 6),
      GlucoseTrackerData(5, 8),
      GlucoseTrackerData(6, 8),
      GlucoseTrackerData(7, 7),
    ];
    return chartData;
  }
}

class HealTrackerData {
  HealTrackerData(this.day, this.mealInCalories);
  late final double day;
  late final double mealInCalories;
}

class MedicineTrackerData {
  MedicineTrackerData(this.day, this.mealInCalories);
  late final double day;
  late final double mealInCalories;
}

class WeightTrackerData {
  WeightTrackerData(this.day, this.weight, this.pointColorMapper);
  late final double day;
  late final double weight;
  final Color pointColorMapper;
}

class TemperatureTrackerData {
  TemperatureTrackerData(this.day, this.temp);
  late final double day;
  late final double temp;
}

class GlucoseTrackerData {
  GlucoseTrackerData(this.day, this.glucose);
  late final double day;
  late final double glucose;
}
