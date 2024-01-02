import 'package:cureways_user/data/network/controllers/store_body_tmp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../utils/const_color.dart';
import '../../widgets/appbar.dart';
import 'health_tracker_screen.dart';

class BodyTemparatureScreen extends StatefulWidget {
  const BodyTemparatureScreen({Key? key}) : super(key: key);

  @override
  State<BodyTemparatureScreen> createState() => _BodyTemparatureScreenState();
}

class _BodyTemparatureScreenState extends State<BodyTemparatureScreen> {
  final _myBox = Hive.box('userBox');
  final _formKey = GlobalKey<FormState>();
  StoreBodyTmpController storeBodyTmpController = StoreBodyTmpController();

  @override
  void didChangeDependencies() {
    storeBodyTmpController = Get.put(StoreBodyTmpController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreBodyTmpController>(
      init: StoreBodyTmpController(),
      builder: (storeBodyTmp) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDefaultBar(
                title: "BODY TEMPERATURE", userNAme: _myBox.get('userName')),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: storeBodyTmp.dateController,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 20),
                                  labelText: '    mm-dd-yyyy',
                                  hintText: '  mm-dd-yyyy',
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                  labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller:
                                    storeBodyTmp.bodyTemperatureController,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 20),
                                  labelText: '    Enter BodyTemperature',
                                  hintText: '    Enter BodyTemperature',
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                  labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: OutlinedButton(
                          onPressed: () {
                            storeBodyTmp.storeBodyTmp(
                              context,
                              storeBodyTmp.dateController.text
                                  .toString()
                                  .trim(),
                              storeBodyTmp.bodyTemperatureController.text
                                  .toString()
                                  .trim(),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: ConstantsColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: storeBodyTmp.loader
                              ? const Center(child: CircularProgressIndicator())
                              : const Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Age and average body temperature',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Your “normal” body temperature changes throughout your life. It often rises from childhood into adulthood before dipping during the later years of life. By stages, it looks like this:',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'For younger children',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'The typical body temperature range for children between birth and 10 years old goes from 95.9 F (35.5 C) to 99.5 F (37.5 C). This would be a temperature measured through an oral reading.',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'For adults and older children',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'The typical body temperature range for people ages 11 to 65 is 97.6 F (36.4 C) to 99.6 F (37.6 C).',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'For older adults',
                        style: TextStyle(
                            color: ConstantsColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'The typical body temperature range for people older than 65 is 96.4 F (35.8 C) to 98.5 F (36.9 C).',
                        style: TextStyle(
                            color: ConstantsColor.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
