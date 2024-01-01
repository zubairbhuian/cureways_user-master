import 'package:cached_network_image/cached_network_image.dart';
import 'package:cureways_user/data/network/controllers/doctor_list_controller.dart';
import 'package:cureways_user/data/network/models/doctor_list_model.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment_screens/doctor_appoinment_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utilis/const_color.dart';

class ForeignDoctor extends StatefulWidget {
  String userName;
  ForeignDoctor({Key? key, required this.userName}) : super(key: key);

  @override
  State<ForeignDoctor> createState() => _ForeignDoctorState();
}

class _ForeignDoctorState extends State<ForeignDoctor> {
  dynamic userName;
  DoctorListController doctorListController = DoctorListController();
  @override
  void initState() {
    userName = widget.userName;
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    doctorListController = Get.put(DoctorListController());
    doctorListController.getDoctorList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorListController>(
      init: DoctorListController(),
      builder: (docList) {
        List<DoctorData> foreignDoctorList = docList.doctorDataList
            .where((doctor) => doctor.type == "Foreign")
            .toList();
        return docList.loader
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                body: Container(
                  color: ConstantsColor.backgroundColor,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: foreignDoctorList.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: foreignDoctorList[index]
                                            .image
                                            .toString(),
                                        imageBuilder: (BuildContext context,
                                                imageProvider) =>
                                            Container(
                                          height: 76,
                                          width: 76,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Image(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[400]!,
                                          child: Container(
                                            height: 76,
                                            width: 76,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          height: 76,
                                          width: 76,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Center(
                                            child: Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              foreignDoctorList[index]
                                                  .name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18,
                                                  color: ConstantsColor
                                                      .primaryColor),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              foreignDoctorList[index]
                                                  .specialist
                                                  .toString(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(0xff8F8F8F),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            // Container(
                                            //   height: 24,
                                            //   width: 65,
                                            //   decoration: BoxDecoration(
                                            //     borderRadius:
                                            //         BorderRadius.circular(5),
                                            //     color: const Color(0xff4E8C82)
                                            //         .withOpacity(.30),
                                            //   ),
                                            //   child: const Center(
                                            //     child: Text(
                                            //       "Available",
                                            //       textAlign: TextAlign.start,
                                            //       style: TextStyle(
                                            //         fontWeight: FontWeight.w500,
                                            //         fontSize: 12,
                                            //         color: Color(0xff0D534B),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                                "assets/doctor_image/3dot Icon.png"),
                                            color: Color(0xff8F8F8F),
                                            height: 24,
                                            width: 24,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DoctorAppoinmentConfirmScreen(
                                                    userName:
                                                        userName.toString(),
                                                    doctorId:
                                                        foreignDoctorList[index]
                                                            .id,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 109,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: ConstantsColor
                                                      .primaryColor),
                                              child: const Center(
                                                child: Text(
                                                  "Appointment",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
