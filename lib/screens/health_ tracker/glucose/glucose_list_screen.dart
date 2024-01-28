import 'package:cureways_user/data/network/controllers/get_glucose_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlucoseListScreen extends StatefulWidget {
  const GlucoseListScreen({super.key});

  @override
  State<GlucoseListScreen> createState() => _GlucoseListScreenState();
}

class _GlucoseListScreenState extends State<GlucoseListScreen> {
  GetGlucoseListController getGlucoseListController =GetGlucoseListController();

  @override
  void didChangeDependencies() {
    getGlucoseListController = Get.put(GetGlucoseListController());
    getGlucoseListController.getGlucoseList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Glucose List".toUpperCase())),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            // margin: const EdgeInsets.all(12),
            width: double.infinity,
            // height: 200,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              // borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextField2(
                      style: const TextStyle(color: kTextColor),

                      controller: getGlucoseListController.fromController,
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
                          getGlucoseListController.fromController.text =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                        }
                      }),
                ),
                10.width,
                Expanded(
                  child: CustomTextField2(
                      controller: getGlucoseListController.toController,
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
                          getGlucoseListController.toController.text =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                        }
                      }),
                ),
                10.width,
                PrimaryBtn(
                  color: kDangerColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
                  child: const Text("Search"),
                  onPressed: () {
                    if (getGlucoseListController.fromController.text.isNotEmpty &&
                        getGlucoseListController.toController.text.isNotEmpty) {
                      getGlucoseListController.getGlucoseList();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<GetGlucoseListController>(
                init: GetGlucoseListController(),
                builder: (controller) {
                  if (controller.glucoseList.isEmpty) {
                    return const Center(child: AppIndecator());
                  }else {
                    var data = controller.glucoseList;
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
                              // 0: FixedColumnWidth(),
                              // 1: FlexColumnWidth()
                              // : const IntrinsicColumnWidth(),
                              // 1: FlexColumnWidth(),
                              // 1: FixedColumnWidth(m.xl ? 200 : 364),
                              // 2: FlexColumnWidth(),
                              // 3: FlexColumnWidth(),
                              // 4: FlexColumnWidth(),
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
                                      child: Text("Time Period Name",
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
                              ...List.generate(data.length, (index) {
                                return TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].date ?? "",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].timePeriod ?? ""),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].timePeriodName ?? ""),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].testResult ?? ""),
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
