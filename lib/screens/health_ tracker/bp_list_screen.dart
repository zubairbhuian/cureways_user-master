import 'package:cureways_user/data/network/controllers/get_bp_list_controller.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: ConstantsColor.primaryColor,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(12.0),
      //         bottomRight: Radius.circular(12.0)),
      //   ),
      //   title: const Text(
      //     "Bp List",
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      // ),
      body: GetBuilder<GetBpListController>(
        init: GetBpListController(),
        builder: (bpList) => bpList.loader
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: bpList.bpList.length,
                  itemBuilder: (context, index) => Padding(
                    padding:  EdgeInsets.all(20.w),
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
                            Text("Systolic: ${bpList.bpList[index].sysotolic}"),
                            const SizedBox(height: 3),
                            Text(
                                "Diastolic: ${bpList.bpList[index].diastolic}"),
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
