import 'package:cureways_user/data/network/controllers/doctor_appoinment_controller.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/doctor_appoinment_screen.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/pages/doctor_profile.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:cureways_user/widgets/network_img.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  DoctorAppoinmentController daController = DoctorAppoinmentController();

  @override
  void didChangeDependencies() {
    daController = Get.put(DoctorAppoinmentController());
    daController.getSpeciaList();
    daController.getSpeciaListDoctors("");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Doctor Appontment"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child:
                GetBuilder<DoctorAppoinmentController>(builder: (controller) {
              var data = controller.doctorSpecialist;
              return CustomDropdownTextFiel(
                  hint: const Text("Choose specialist"),
                  items: List.generate(
                      data.length,
                      (index) => DropdownMenuItem<String>(
                            value: data[index].id.toString(),
                            child: Text(
                              data[index].name.toString(),
                              style: kBodyLarge,
                            ),
                          )),
                  onChanged: (String? value) {
                    kLogger.e(value);
                    if (value != null) {
                      daController.getSpeciaListDoctors(value);
                    }
                  });
            }),
          ),
          Expanded(
            child:
                GetBuilder<DoctorAppoinmentController>(builder: (controller) {
              if (controller.doctorList == null) {
                return const Center(
                  child: AppIndecator(),
                );
              }
              if (controller.doctorList!.isEmpty) {
                return const Center(
                  child: Text("No Data Found"),
                );
              }
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      controller.doctorList!.length,
                      (index) => GestureDetector(
                            onTap: () {
                              Get.to(() => DoctorProfile(index));
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(34, 34, 34, 0.138),
                                      offset: Offset(4, 8),
                                      blurRadius: 24,
                                      spreadRadius: 4,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(800),
                                      child: Container(
                                          color:
                                              kTextColorLight.withOpacity(.2),
                                          child: const NetworkImg(
                                            '',
                                            width: 50,
                                            height: 50,
                                          ))),
                                  10.width,
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .doctorList![index].user.name,
                                            style: kLabelLarge,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            controller.doctorList![index]
                                                .hospital.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ]),
                                  ),
                                  10.width,
                                  PrimaryBtn(
                                    padding: EdgeInsets.zero,
                                    child: const Text("Book"),
                                    onPressed: () {
                                      Get.to(() => const DoctorAppointmentScreen());
                                    },
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
