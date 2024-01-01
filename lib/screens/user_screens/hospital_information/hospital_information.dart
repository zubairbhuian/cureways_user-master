import 'package:cureways_user/screens/user_screens/hospital_information/hospital_about.dart';
import 'package:cureways_user/screens/user_screens/hospital_information/hospital_contact.dart';
import 'package:cureways_user/screens/user_screens/hospital_information/hospital_location.dart';
import 'package:flutter/material.dart';

import '../../../utilis/const_color.dart';
import '../../../widgets/appbar.dart';

class HospitalInformation extends StatefulWidget {
  const HospitalInformation({Key? key}) : super(key: key);

  @override
  State<HospitalInformation> createState() => _HospitalInformationState();
}

class _HospitalInformationState extends State<HospitalInformation>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstantsColor.backgroundColor,
        child: Column(
          children: [
            AppDefaultBar(title: "HOSPITAL INFORMATION", userNAme: "userNAme"),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 228,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Image(
                        image: AssetImage(
                          "assets/home_screen/Hospital Image.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "CURE WAYS",
                      style: TextStyle(
                          color: ConstantsColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TabBar(
                              isScrollable: true,
                              labelColor: Colors.white,
                              unselectedLabelColor: ConstantsColor.primaryColor,
                              indicatorPadding:
                                  const EdgeInsets.only(top: 6, bottom: 6),
                              indicator: BoxDecoration(
                                border: Border.all(
                                  color: ConstantsColor.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(4),
                                color: ConstantsColor.primaryColor,
                              ),
                              tabs: const [
                                Tab(
                                  child: Text(
                                    "ABOUT",
                                    style: TextStyle(),
                                  ),
                                ),
                                Tab(
                                    child: Text(
                                  "ADDRESS",
                                  style: TextStyle(),
                                )),
                                Tab(
                                    child: Text(
                                  "CONTACT",
                                  style: TextStyle(),
                                )),
                                Tab(
                                    child: Text(
                                  "LOCATION",
                                  style: TextStyle(),
                                )),
                              ],
                              controller: _tabController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Flexible(
                        child: TabBarView(
                      controller: _tabController,
                      children: const [
                        HospitalAbout(),
                        Center(child: Text("Not Available Yet")),
                        HospitalContact(),
                        HospitalLocation(),
                      ],
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
