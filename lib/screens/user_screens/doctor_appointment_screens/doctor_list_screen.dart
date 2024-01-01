import 'package:cureways_user/screens/user_screens/doctor_appointment_screens/foreign_doctor/foreign_doctor.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment_screens/local_doctor/local_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilis/const_color.dart';
import 'local_doctor/local_cardiology.dart';

class DoctorListScreen extends StatefulWidget {
  String userName;
  DoctorListScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  final TextEditingController _searchController = TextEditingController();
  dynamic userName;
  @override
  void initState() {
    userName = widget.userName;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              padding: const EdgeInsets.only(bottom: 8, left: 4, right: 4),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Creates border
                  color: ConstantsColor.primaryColor),
              labelColor: Colors.white,
              unselectedLabelColor: ConstantsColor.primaryColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: "Local",
                ),
                Tab(
                  text: "Foreign",
                )
              ]),
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0)),
          ),
          title: Column(
            children: [
              //SizedBox(height: 42,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, $userName!",
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
                height: 4,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LocalCardiology(
              userName: userName,
            ),
            ForeignDoctor(
              userName: userName,
            ),
          ],
        ),
      ),
    );
  }
}
