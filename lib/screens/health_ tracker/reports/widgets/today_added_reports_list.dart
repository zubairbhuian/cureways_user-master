import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayAddedReportsList extends StatelessWidget {
  const TodayAddedReportsList({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<GetDietListController>(builder: (controller) {
      if (controller.todayFilteredList.isEmpty) {
        return const SizedBox();
      }
      return Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: ConstantsColor.backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child:  Table(
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
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      // header
                      const TableRow(
                        decoration: BoxDecoration(
                          color:  ConstantsColor.primaryColor
                        ),
                        children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text("Date",
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text("Time",
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
                        ),
                         Padding(
                          padding: EdgeInsets.all(12),
                          child: Text("Food Type",
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text("Food Quantity",
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
                        ),
                      ]),
                      ...List.generate(controller.todayFilteredList.length, (index) {
                        return TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(controller.todayFilteredList[index].date ?? "",
                                style: const TextStyle(fontWeight: FontWeight.w400)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(controller.todayFilteredList[index].time ?? ""),
                          ),
                            Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(controller.todayFilteredList[index].foodType ?? ""),
                          ),
                            Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(controller.todayFilteredList[index].foodQty ?? ""),
                          ),
                        ]);
                      })
                    ]),
          );
        
    });
  }
}
