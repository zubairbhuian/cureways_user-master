import 'package:cureways_user/data/network/controllers/get_diet_list_controller.dart';
import 'package:cureways_user/utilis/const_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietListScreen extends StatefulWidget {
  const DietListScreen({super.key});

  @override
  State<DietListScreen> createState() => _DietListScreenState();
}

class _DietListScreenState extends State<DietListScreen> {
  GetDietListController getDietListController = GetDietListController();

  @override
  void didChangeDependencies() {
    getDietListController = Get.put(GetDietListController());
    getDietListController.getDietList();
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
          "Diet List",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<GetDietListController>(
        init: GetDietListController(),
        builder: (dietList) => dietList.loader
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: dietList.dietList.length,
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
                                "Food quantity: ${dietList.dietList[index].foodQty}"),
                            const SizedBox(height: 3),
                            Text("Date: ${dietList.dietList[index].date}"),
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
