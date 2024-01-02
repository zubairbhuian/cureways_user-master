import 'package:cureways_user/data/network/controllers/get_tmp_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyTmpScreen extends StatefulWidget {
  const BodyTmpScreen({super.key});

  @override
  State<BodyTmpScreen> createState() => _BodyTmpScreenState();
}

class _BodyTmpScreenState extends State<BodyTmpScreen> {
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ConstantsColor.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0)),
        ),
        title: const Text(
          "Body Temperature List",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<GetTmpListController>(
        init: GetTmpListController(),
        builder: (tmpList) => tmpList.loader
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: tmpList.tmpList.length,
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
                            Text(
                                "Body Temperature: ${tmpList.tmpList[index].bodyTemperature}"),
                            const SizedBox(height: 3),
                            Text("Date: ${tmpList.tmpList[index].date}"),
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
