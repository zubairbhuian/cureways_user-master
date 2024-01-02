import 'package:cureways_user/data/network/models/blood_bank_search_response_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';

class BloodBankListScreen extends StatefulWidget {
  final List<BloodBankSearch> bloodBankList;
  const BloodBankListScreen({Key? key, required this.bloodBankList})
      : super(key: key);

  @override
  State<BloodBankListScreen> createState() => _BloodBankListScreenState();
}

class _BloodBankListScreenState extends State<BloodBankListScreen> {
  final _myBox = Hive.box('userBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstantsColor.backgroundColor,
        child: Column(
          children: [
            AppDefaultBar(
                title: "BLOOD BANK", userNAme: "${_myBox.get('userName')}"),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: widget.bloodBankList.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 76,
                                width: 76,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Image(
                                  image: AssetImage(
                                    "assets/blood_bank/bloodbank_photo.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.bloodBankList[index].name}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: ConstantsColor.primaryColor),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${widget.bloodBankList[index].division}",
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
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                      _makePhoneCall(widget
                                          .bloodBankList[index].phone
                                          .toString());
                                    },
                                    child: Container(
                                      height: 32,
                                      width: 109,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: ConstantsColor.primaryColor),
                                      child: const Center(
                                        child: Text(
                                          "Call",
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
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
