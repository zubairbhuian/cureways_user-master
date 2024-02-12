import 'package:cureways_user/data/network/controllers/get_bp_list_controller.dart';
import 'package:cureways_user/utils/Int_extensions.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BpListScreen extends StatefulWidget {
  const BpListScreen({super.key});

  @override
  State<BpListScreen> createState() => _BpListScreenState();
}

class _BpListScreenState extends State<BpListScreen> {
  GetBpListController getBpListController = GetBpListController();

  @override
  void didChangeDependencies() {
    getBpListController = Get.put(GetBpListController());
    getBpListController.getBpList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Bp List".toUpperCase())),
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
              
                      controller: getBpListController.fromController,
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
                          getBpListController.fromController.text =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                        }
                      }),
                ),
                10.width,
                Expanded(
                  child: CustomTextField2(
                      controller: getBpListController.toController,
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
                          getBpListController.toController.text =
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
                    if (getBpListController.fromController.text.isNotEmpty &&
                        getBpListController.toController.text.isNotEmpty) {
                      kLogger.e("message");
                      getBpListController.getBpList();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<GetBpListController>(
                init: GetBpListController(),
                builder: (controller) {
                  if (controller.bpList.isEmpty) {
                    return const Center(child: AppIndecator());
                  } else {
                    var data = controller.bpList;
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
                              0: FixedColumnWidth(100),
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
                                      child: Text("Sysotolic",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text("Diastolic",

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
                                    child: Text(data[index].time ?? ""),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].sysotolic ?? ""),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(data[index].diastolic ?? ""),
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
