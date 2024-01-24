import 'package:cureways_user/data/network/controllers/add_health_profile_controller.dart';
import 'package:cureways_user/screens/health_profile/update_health_profile_screen.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../widgets/appbar.dart';

class GetHealthProfileScreen extends StatefulWidget {
  const GetHealthProfileScreen({super.key});

  @override
  State<GetHealthProfileScreen> createState() => _GetHealthProfileScreenState();
}

class _GetHealthProfileScreenState extends State<GetHealthProfileScreen> {
  AddHealthProfileController addHealthProfileController =
      AddHealthProfileController();

  @override
  void didChangeDependencies() {
    addHealthProfileController = Get.put(AddHealthProfileController());
    addHealthProfileController.showHealthProfile();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Get Health Profile")),
      // appBar: AppBar(
      //   toolbarHeight: 152,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: ConstantsColor.primaryColor,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(12.0),
      //         bottomRight: Radius.circular(12.0)),
      //   ),
      //   title: Column(
      //     children: [
      //       //SizedBox(height: 42,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Expanded(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "Hi,${_myBox.get('userName')}",
      //                   textAlign: TextAlign.start,
      //                   style: const TextStyle(
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.w600,
      //                       color: Colors.white),
      //                 ),
      //                 const Text(
      //                   "Welcome back",
      //                   textAlign: TextAlign.start,
      //                   style: TextStyle(
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.w400,
      //                       color: Colors.white),
      //                 )
      //               ],
      //             ),
      //           ),
      //           // IconButton(
      //           //   onPressed: () {
      //           //     Get.to(() => const UpdateHealthProfileScreen());
      //           //   },
      //           //   icon: const Icon(Icons.edit_outlined),
      //           // ),
      //         ],
      //       ),
      //       const SizedBox(height: 16),
      //       const Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'SHOW HEALTH PROFILE',
      //             textAlign: TextAlign.start,
      //             style: TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w600,
      //                 color: Colors.white),
      //           )
      //         ],
      //       )
      //     ],
      //   ),
      // ),
     
      body: GetBuilder<AddHealthProfileController>(
        init: AddHealthProfileController(),
        builder: (getHealthProfile) => getHealthProfile.loader
            ? const Center(child: AppIndecator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        "Show of your health record",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstantsColor.primaryColor),
                      ),
                      const SizedBox(height: 16),
                      const Text('Age'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.age.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Gender'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: getHealthProfile.gender == "1"
                            ? const Text('Male')
                            : const Text('Female'),
                      ),
                      const SizedBox(height: 8),
                      const Text('Height'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.height.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Weight'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.weight.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Marital Status'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.marital.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Chef Complain'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.chiefComplain.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Previous Disease'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.prevDisease.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Operation History'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.otHistory.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Medications'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.medication.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Physical Disabilities'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.disabilities.toString()),
                      ),
                      const SizedBox(height: 8),
                      const Text('Test Result'),
                      const SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: ConstantsColor.greyColor),
                        ),
                        child: Text(getHealthProfile.testResult.toString()),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
