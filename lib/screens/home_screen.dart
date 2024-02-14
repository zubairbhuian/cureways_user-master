import 'package:cureways_user/data/network/controllers/profile_controller.dart';
import 'package:cureways_user/screens/user_screens/ambulance_screens/ambulance_screen.dart';
import 'package:cureways_user/screens/user_screens/blood_bank_screens/blood_bank_screen.dart';
import 'package:cureways_user/screens/user_screens/blood_bank_screens/blood_bank_user_type_screen.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/doctor_appoinment_screen.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/doctor_list_screen.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/pages/doctors_list_screen.dart';
import 'package:cureways_user/screens/user_screens/health_tips/health_tips_main_screen.dart';
import 'package:cureways_user/screens/user_screens/hospital_information/hospital_list_Screen.dart';
import 'package:cureways_user/screens/user_screens/medicine_screens/medicine_list_screen.dart';
import 'package:cureways_user/screens/user_screens/overseas_treatment/hide_screen/overseas_screen.dart';
import 'package:cureways_user/screens/user_screens/vaccine/hideScreen/vaccine_list.dart';
import 'package:cureways_user/screens/user_screens/vaccine/vaccine_request.dart';
import 'package:cureways_user/screens/user_screens/virtual_lab/virtual_lab_screen.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/widgets/network_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/const_color.dart';
import '../utils/mixins.dart';
import 'health_tracker/health_tracker_screen.dart';
import 'health_profile/health_profile_screen.dart';
import 'user_screens/overseas_treatment/overseas_treatment_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileController profileController = ProfileController();

  @override
  void didChangeDependencies() {
    profileController = Get.put(ProfileController());
    profileController.getUserInfo();
    super.didChangeDependencies();
  }

  dynamic userName;
  @override
  void initState() {
    userName = widget.userName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // profile
                ClipRRect(
                  borderRadius: BorderRadius.circular(800),
                  child: CircleAvatar(
                    radius: 20,
                    child: NetworkImg(profileController.userPhoto),
                  ),
                ),
                12.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Morning 👋",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: kTextColorLight),
                      ),
                      Text(
                        "$userName!".toUpperCase(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: kBlack),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/Notification.svg",
                ),
                12.width,
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: SvgPicture.asset(
                    "assets/icons/Heart.svg",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // banner
            Container(
              height: 147,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(0, 14), // x, y offset
                  blurRadius: 34,
                  spreadRadius: 0,
                  color: Color(0xFFE2EBFF), // Replace with your desired color
                ),
              ]),
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: const Image(
                  image: AssetImage(
                    "assets/images/banner.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // main contant
            Text(
              "Services",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.w,
                    mainAxisSpacing: 19.w,
                    mainAxisExtent: 123,
                  ),
                  itemCount: Mixins().mainMenuItem.length,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (
                            Mixins().mainMenuItem.elementAt(index)["title"]) {
                          case "Health Profile":
                            Get.to(() => const HealthProfileScreen());
                            break;
                          case "Health Tracker":
                            Get.to(() => HealthTrackerScreen(
                                  userName: userName,
                                ));
                            break;
                          case "Doctor Appointment":
                            Get.to(() => const DoctorsListScreen());
                            break;
                          case "Blood Bank":
                            Get.to(() =>  BloodBankUserTypeScreen());
                            break;
                          case "Vaccine":
                            Get.to(() => const VaccineRequestScreen());
                            break;
                          case "Overseas Treatment":
                            Get.to(() => const OverseasTreatmentScreen(
                                ));
                            break;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 14), // x, y offset
                                blurRadius: 34,
                                spreadRadius: 0,
                                color: Color.fromARGB(255, 234, 241,
                                    253), // Replace with your desired color
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "${Mixins().mainMenuItem.elementAt(index)["images"]}",
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${Mixins().mainMenuItem.elementAt(index)["title"]}",
                              style: const TextStyle(
                                  color: kTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
