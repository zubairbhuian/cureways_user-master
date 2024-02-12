import 'package:cureways_user/data/network/controllers/get_weight_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
      appBar: CustomAppBar(title: Text("Weight List".toUpperCase())),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            // margin: const EdgeInsets.all(12),
            width: double.infinity,
            // height: 200,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.9),
              // borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextField2(
                      style: const TextStyle(color: kTextColor),
                      controller: getWeightListController.fromController,
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
                          getWeightListController.fromController.text =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                        }
                      }),
                ),
                10.width,
                Expanded(
                  child: CustomTextField2(
                      controller: getWeightListController.toController,
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
                          getWeightListController.toController.text =
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
                    if (getWeightListController.fromController.text.isNotEmpty &&
                        getWeightListController.toController.text.isNotEmpty) {
                      getWeightListController.getWeightList();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<GetWeightListController>(
                init: GetWeightListController(),
                builder: (controller) {
                  if (controller.weightList.isEmpty) {
                    return const Center(child: AppIndecator());
                  }else {
                    var data = controller.weightList;
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
                                      child: Text("Weight",
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
                                    child: Text(data[index].weight ?? ""),
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
