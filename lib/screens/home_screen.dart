import 'package:cureways_user/screens/user_screens/ambulance_screens/ambulance_screen.dart';
import 'package:cureways_user/screens/user_screens/blood_bank_screens/blood_bank_user_type_screen.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment_screens/doctor_list_screen.dart';
import 'package:cureways_user/screens/user_screens/health_tips/health_tips_main_screen.dart';
import 'package:cureways_user/screens/user_screens/hospital_information/hospital_list_Screen.dart';
import 'package:cureways_user/screens/user_screens/medicine_screens/medicine_list_screen.dart';
import 'package:cureways_user/screens/user_screens/overseas_treatment/overseas_screen.dart';
import 'package:cureways_user/screens/user_screens/vaccine/vaccine_list.dart';
import 'package:cureways_user/screens/user_screens/virtual_lab/virtual_lab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilis/const_color.dart';
import '../utilis/mixins.dart';
import 'ask_doctor/ask_doctor_main_screen.dart';
import 'health_ tracker/health_tracker_screen.dart';
import 'health_profile/health_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  String userName;
  HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic userName;
  @override
  void initState() {
    userName = widget.userName;
    print("Here is User =>> $userName");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F4B97).withOpacity(0.15),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hi,$userName!",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff0F4B97)),
                    ),
                    const Text(
                      "Welcome back",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff0F4B97)),
                    )
                  ],
                ),
                SvgPicture.asset(
                  "assets/home_screen/bell.svg",
                  height: 32,
                  width: 32,
                  color: const Color(0xff0F4B97),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 116,
              width: double.maxFinite,
              child: Image(
                image: AssetImage(
                  "assets/home_screen/Multiply.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 105,
                  ),
                  itemCount: Mixins().mainMenuItem.length,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (
                            Mixins().mainMenuItem.elementAt(index)["title"]) {
                          case "DOCTOR APPOINTMENT":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorListScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "BLOOD BANK":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BloodBankUserTypeScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "AMBULANCE":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AmbulanceScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "HOSPITAL INFORMATION":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HospitalListScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "VACCINE":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VaccineList(
                                          userName: userName,
                                        )));
                            break;
                          case "HEALTH\nTRACKER":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HealthTrackerScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "VIRTUAL LAB":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VirtualLabScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "HEALTH PROFILE":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HealthProfileScreen()));
                            break;
                          case "OVERSEAS TREATMENT":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OverSeastreatmentScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "HEALTH TIPS":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HealtipsMainScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "ASK \nDOCTOR":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AskDoctorMainScreen(
                                          userName: userName,
                                        )));
                            break;
                          case "MEDICINE":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MedicineListScreen(
                                          userName: userName,
                                        )));
                            break;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ConstantsColor.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //height:80,
                        // width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  "${Mixins().mainMenuItem.elementAt(index)["images"]}"),
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${Mixins().mainMenuItem.elementAt(index)["title"]}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
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
