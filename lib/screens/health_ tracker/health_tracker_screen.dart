import 'package:carousel_slider/carousel_slider.dart';
import 'package:cureways_user/screens/health_%20tracker/body_temparature_screen.dart';
import 'package:cureways_user/screens/health_%20tracker/bp_tracker.dart';
import 'package:cureways_user/screens/health_%20tracker/diet_tracker_screen.dart';
import 'package:cureways_user/screens/health_%20tracker/glucose_tracker_screen.dart';
import 'package:cureways_user/screens/health_%20tracker/weight_list_screen.dart';
import 'package:cureways_user/screens/health_%20tracker/weight_tracker_screen.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utilis/const_color.dart';
import 'body_tmp_screen.dart';
import 'bp_list_screen.dart';
import 'diet_list_screen.dart';
import 'glucose_list_screen.dart';

class HealthTrackerScreen extends StatefulWidget {
  String? userName;
  HealthTrackerScreen({Key? key, this.userName}) : super(key: key);

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
  int _currentIndex = 0;
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
      body: Column(
        children: [
          AppDefaultBar(title: "HEALTH TRACKER", userNAme: "$userName"),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: ConstantsColor.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff082244),
                            borderRadius: BorderRadius.circular(10)),
                        height: 125,
                        width: double.maxFinite,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
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
                              PieChart(
                                dataMap: dataMap,
                                chartType: ChartType.ring,
                                chartRadius: 100,
                                ringStrokeWidth: 15,
                                initialAngleInDegree: 80,
                                centerText: "80%",
                                centerTextStyle: const TextStyle(
                                    backgroundColor: Color(0xff082244),
                                    fontSize: 18),
                                baseChartColor: const Color(0xff6D90C6),
                                colorList: colorList,
                                chartValuesOptions: const ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                  showChartValues: false,
                                ),
                                legendOptions:
                                    const LegendOptions(showLegends: false),
                                totalValue: 100,
                              ),
                            ],
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 8,
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
                        height: 8,
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
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "DIET TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff082244),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff082244),
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      PieChart(
                                        dataMap: dietMap,
                                        chartType: ChartType.ring,
                                        chartRadius: 45,
                                        ringStrokeWidth: 5,
                                        initialAngleInDegree: 80,
                                        centerText: "80%",
                                        centerTextStyle: const TextStyle(
                                            backgroundColor: Color(0xff082244),
                                            fontSize: 12),
                                        baseChartColor: const Color(0xff6D90C6),
                                        colorList: colorList,
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValuesInPercentage: true,
                                          showChartValues: false,
                                        ),
                                        legendOptions: const LegendOptions(
                                            showLegends: false),
                                        totalValue: 100,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Text(
                                        "7 DAYS",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
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
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 232,
                        child: SfCartesianChart(
                          series: <ChartSeries>[
                            LineSeries<HealTrackerData, double>(
                              dataSource: getChartData(),
                              xValueMapper: (HealTrackerData day, _) => day.day,
                              yValueMapper: (HealTrackerData day, _) =>
                                  day.mealInCalories,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "BP TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff082244),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff082244),
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      PieChart(
                                        dataMap: bpTracker,
                                        chartType: ChartType.ring,
                                        chartRadius: 45,
                                        ringStrokeWidth: 5,
                                        initialAngleInDegree: 80,
                                        centerText: "00%",
                                        centerTextStyle: const TextStyle(
                                            backgroundColor: Color(0xff082244),
                                            fontSize: 12),
                                        baseChartColor: const Color(0xff6D90C6),
                                        colorList: colorList,
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValuesInPercentage: true,
                                          showChartValues: false,
                                        ),
                                        legendOptions: const LegendOptions(
                                            showLegends: false),
                                        totalValue: 100,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Text(
                                        "7 DAYS",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
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
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 232,
                        child: SfCartesianChart(
                          series: <ChartSeries>[
                            LineSeries<MedicineTrackerData, double>(
                              dataSource: getMedData(),
                              xValueMapper: (MedicineTrackerData day, _) =>
                                  day.day,
                              yValueMapper: (MedicineTrackerData day, _) =>
                                  day.mealInCalories,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "GLUCOSE TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff082244),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff082244),
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      PieChart(
                                        dataMap: glucoseTracker,
                                        chartType: ChartType.ring,
                                        chartRadius: 45,
                                        ringStrokeWidth: 5,
                                        initialAngleInDegree: 80,
                                        centerText: "00%",
                                        centerTextStyle: const TextStyle(
                                            backgroundColor: Color(0xff082244),
                                            fontSize: 12),
                                        baseChartColor: const Color(0xff6D90C6),
                                        colorList: colorList,
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValuesInPercentage: true,
                                          showChartValues: false,
                                        ),
                                        legendOptions: const LegendOptions(
                                            showLegends: false),
                                        totalValue: 100,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Text(
                                        "7 DAYS",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
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
                        height: 8,
                      ),
                      SizedBox(
                        height: 232,
                        child: SfCartesianChart(
                          series: <ChartSeries>[
                            LineSeries<GlucoseTrackerData, double>(
                              dataSource: getGlucoseTrackerData(),
                              xValueMapper: (GlucoseTrackerData day, _) =>
                                  day.day,
                              yValueMapper: (GlucoseTrackerData day, _) =>
                                  day.glucose,
                            )
                          ],
                        ),
                      ),
                      const Text(
                        "BODY TEMPERATURE",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff082244),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff082244),
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      PieChart(
                                        dataMap: bodyTemperature,
                                        chartType: ChartType.ring,
                                        chartRadius: 45,
                                        ringStrokeWidth: 5,
                                        initialAngleInDegree: 80,
                                        centerText: "00%",
                                        centerTextStyle: const TextStyle(
                                            backgroundColor: Color(0xff082244),
                                            fontSize: 12),
                                        baseChartColor: const Color(0xff6D90C6),
                                        colorList: colorList,
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValuesInPercentage: true,
                                          showChartValues: false,
                                        ),
                                        legendOptions: const LegendOptions(
                                            showLegends: false),
                                        totalValue: 100,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Text(
                                        "7 DAYS",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
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
                              Get.to(() => const BodyTmpScreen());
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
                      SizedBox(
                        height: 232,
                        child: SfCartesianChart(
                          series: <ChartSeries>[
                            LineSeries<TemperatureTrackerData, double>(
                              dataSource: getTemperatureTrackerData(),
                              xValueMapper: (TemperatureTrackerData day, _) =>
                                  day.day,
                              yValueMapper: (TemperatureTrackerData day, _) =>
                                  day.temp,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "WEIGHT TRACKER",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff082244),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff082244),
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 80,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      PieChart(
                                        dataMap: bodyTemperature,
                                        chartType: ChartType.ring,
                                        chartRadius: 45,
                                        ringStrokeWidth: 5,
                                        initialAngleInDegree: 80,
                                        centerText: "00%",
                                        centerTextStyle: const TextStyle(
                                            backgroundColor: Color(0xff082244),
                                            fontSize: 12),
                                        baseChartColor: const Color(0xff6D90C6),
                                        colorList: colorList,
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValuesInPercentage: true,
                                          showChartValues: false,
                                        ),
                                        legendOptions: const LegendOptions(
                                            showLegends: false),
                                        totalValue: 100,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Text(
                                        "7 DAYS",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
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
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 232,
                        child: SfCartesianChart(
                          series: <ChartSeries>[
                            LineSeries<WeightTrackerData, double>(
                              dataSource: getWeightTrackerData(),
                              xValueMapper: (WeightTrackerData day, _) =>
                                  day.day,
                              yValueMapper: (WeightTrackerData day, _) =>
                                  day.weight,
                              pointColorMapper: (WeightTrackerData day, _) =>
                                  day.pointColorMapper,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
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
      MedicineTrackerData(1, 2),
      MedicineTrackerData(2, 3),
      MedicineTrackerData(3, 2),
      MedicineTrackerData(4, 3),
      MedicineTrackerData(5, 4),
      MedicineTrackerData(6, 2),
      MedicineTrackerData(7, 3),
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
