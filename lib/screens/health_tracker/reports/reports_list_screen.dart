import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/data/network/controllers/reports_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportsListScreen extends StatefulWidget {
  const ReportsListScreen({super.key});

  @override
  State<ReportsListScreen> createState() => _ReportsListScreenState();
}

class _ReportsListScreenState extends State<ReportsListScreen> {
 ReportsController reportController = ReportsController();

  @override
  void didChangeDependencies() {
    reportController = Get.put(ReportsController());
    reportController.getReportList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Reports List".toUpperCase())),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            // margin: const EdgeInsets.all(12),
            width: double.infinity,
            // height: 200,
            decoration:  BoxDecoration(
              color: kPrimaryColor.withOpacity(.9),
              // borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextField2(
                      style: const TextStyle(color: kTextColor),
                      controller: reportController.fromController,
                      marginBottom: 0,
                      hintText: "From",
                      keyboardType: TextInputType.text,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          reportController.fromController.text =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                        }
                      }),
                ),
                10.width,
                Expanded(
                  child: CustomTextField2(
                      controller: reportController.toController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: kTextColor),
                      hintText: "To",
                      marginBottom: 0,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          reportController.toController.text =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                        }
                      }),
                ),
                10.width,
                PrimaryBtn(
                  color: kPrimaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                  child: const Text("Search"),
                  onPressed: () {
                    if (reportController.fromController.text.isNotEmpty &&
                        reportController.toController.text.isNotEmpty) {
                      reportController.getReportList();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<ReportsController>(
                init: ReportsController(),
                builder: (controller) {
                  if (controller.resultList == null) {
                    return const Center(child: AppIndecator());
                  }
                  if (controller.resultList!.isEmpty) {
                    return const Center(
                        child: Text(
                      "No Data Found",
                      style: TextStyle(color: kDisabledTextColor),
                    ));
                  } else {
                    var data = controller.resultList;
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 22),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ConstantsColor.backgroundColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Table(
                            border: TableBorder.all(),
                            columnWidths: const <int, TableColumnWidth>{
                            },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              // header
                              const TableRow(
                                  decoration: BoxDecoration(
                                      color: ConstantsColor.primaryColor),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text("Date",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text("Time",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text("Test Type",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text("Result",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white)),
                                    ),
                                  ]),
                              ...List.generate(data!.length, (index) {
                                return TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].date ?? "",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].time ?? ""),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].testType ?? ""),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].result ?? ""),
                                  ),
                                ]);
                              })
                            ]),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
