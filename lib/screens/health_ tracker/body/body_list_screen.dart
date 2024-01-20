import 'package:cureways_user/data/network/controllers/get_tmp_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyListScreen extends StatefulWidget {
  const BodyListScreen({super.key});

  @override
  State<BodyListScreen> createState() => _BodyListScreenState();
}

class _BodyListScreenState extends State<BodyListScreen> {
  GetTmpListController getTmpListController = GetTmpListController();

  @override
  void didChangeDependencies() {
    getTmpListController = Get.put(GetTmpListController());
    getTmpListController.getTmpList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Body Temperature List".toUpperCase())),
      body: GetBuilder<GetTmpListController>(
        init: GetTmpListController(),
        builder: (tmpList) => tmpList.loader
            ? const Center(child: AppIndecator())
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: tmpList.uniqueList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: ConstantsColor.backgroundColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Date: ${tmpList.uniqueList[index].date}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
