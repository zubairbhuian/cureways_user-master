import 'package:carousel_slider/carousel_slider.dart';
import 'package:cureways_user/data/network/controllers/get_ask_doctor_controller.dart';
import 'package:cureways_user/data/network/controllers/store_ask_doctor_controller.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/const_color.dart';
import '../../utils/mixins.dart';

class AskDoctorMainScreen extends StatefulWidget {
  String userName;
  AskDoctorMainScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<AskDoctorMainScreen> createState() => _AskDoctorMainScreenState();
}

class _AskDoctorMainScreenState extends State<AskDoctorMainScreen> {
  String? search = '';
  final TextEditingController _searchController = TextEditingController();
  final List<String> askdoctorImages = [
    'assets/doctor_image/Profile photo.png',
    'assets/doctor_image/Profile photo_1.png'
  ];
  final List<String> doctorName = [
    "Dr. Hafsa JH",
    "Dr. Anisuzzaman",
  ];
  final List<String> healthTipsText = [
    "Domestic method of Covid 19 \n New variant...",
    "Loreim Ipsum text varaible\n New variant...",
  ];
  final List<String> healthTipsDate = [
    "10 Jun 2023",
    "20 Jul 2023",
  ];
  final List<String> healthTipsLove = [
    "10k",
    "20k",
  ];
  final List<String> healthTipsComment = [
    "5k",
    "3k",
  ];
  final List<String> healthTipsReply = [
    "8k",
    "12k",
  ];
  dynamic userName;
  final int _currentIndex = 0;

  StoreAskDoctorController storeAskDoctorController =
      StoreAskDoctorController();
  GetAskDoctorController getAskDoctorController = GetAskDoctorController();

  @override
  void initState() {
    userName = widget.userName;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    storeAskDoctorController = Get.put(StoreAskDoctorController());
    getAskDoctorController = Get.put(GetAskDoctorController());
    getAskDoctorController.getAskDoctor();
    super.didChangeDependencies();
  }

//for carousel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Ask Doctor")),
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(12.0),
      //         bottomRight: Radius.circular(12.0)),
      //   ),
      //   title: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: [
      //         //SizedBox(height: 42,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Expanded(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "Hi, $userName!",
      //                     textAlign: TextAlign.start,
      //                     style: const TextStyle(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.w700,
      //                         color: Color(0xff0F4B97)),
      //                   ),
      //                   const Text(
      //                     "Welcome back",
      //                     textAlign: TextAlign.start,
      //                     style: TextStyle(
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.w400,
      //                         color: Color(0xff0F4B97)),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             SvgPicture.asset(
      //               "assets/home_screen/bell.svg",
      //               height: 32,
      //               width: 32,
      //               color: const Color(0xff0F4B97),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      
      body: GetBuilder<StoreAskDoctorController>(
        init: StoreAskDoctorController(),
        builder: (storeAskDoctor) => Container(
          color: ConstantsColor.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GetBuilder<GetAskDoctorController>(
                    init: GetAskDoctorController(),
                    builder: (getAskDoc) => getAskDoc.loader
                        ? const Center(child: AppIndecator())
                        : ListView.builder(
                            reverse: true,
                            itemCount: getAskDoc.getAskDoctorList.length,
                            itemBuilder: (context, int index) {
                              return Card(
                                  color: ConstantsColor.backgroundColor,
                                  child: Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          getAskDoc.getAskDoctorList[index]
                                                      .question !=
                                                  null
                                              ? Text(
                                                  "Question: ${getAskDoc.getAskDoctorList[index].question}",
                                                  maxLines: 2,
                                                  textAlign: TextAlign.start,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      //  fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : const Text(""),
                                          const SizedBox(height: 10),
                                          getAskDoc.getAskDoctorList[index]
                                                      .ans !=
                                                  null
                                              ? Text(
                                                  "Answer: ${getAskDoc.getAskDoctorList[index].ans}",
                                                  maxLines: 2,
                                                  textAlign: TextAlign.start,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      //  fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : const Text(""),
                                          const SizedBox(height: 10),
                                          getAskDoc.getAskDoctorList[index]
                                                      .ansName !=
                                                  null
                                              ? Text(
                                                  "Answer Provider: ${getAskDoc.getAskDoctorList[index].ansName}",
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      //  fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                )
                                              : const Text(""),
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                          ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: storeAskDoctor.questionController,
                            keyboardType: TextInputType.text,
                            hintText: 'Ask for health tips',
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        const VerticalDivider(),
                        InkWell(
                          onTap: () {
                            storeAskDoctor.storeAskDoctor(
                              context,
                              storeAskDoctor.questionController.text
                                  .toString()
                                  .trim(),
                            );
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: ConstantsColor.primaryColor,
                            child: Center(
                              child: storeAskDoctor.loader
                                  ? const AppIndecator()
                                  : const Icon(Icons.send, size: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
