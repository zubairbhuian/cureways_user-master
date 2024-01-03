import 'package:cureways_user/screens/user_screens/blood_bank_screens/blood_bank_screen.dart';
import 'package:cureways_user/screens/user_screens/blood_bank_screens/blood_donor_registration.dart';
import 'package:flutter/material.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';

class BloodBankUserTypeScreen extends StatefulWidget {
  String userName;
  BloodBankUserTypeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<BloodBankUserTypeScreen> createState() =>
      _BloodBankUserTypeScreenState();
}

class _BloodBankUserTypeScreenState extends State<BloodBankUserTypeScreen> {
  dynamic userName;
  @override
  void initState() {
    userName = widget.userName;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppDefaultBar(title: "BLOOD BANK", userNAme: userName),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170, left: 16, right: 16),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const BloodDonorRegistrationScreen()));
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                    width: 1.0,
                                    color: ConstantsColor.greyColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const FittedBox(
                                child: Text(
                                  'BLOOD DONOR REGISTRATION',
                                  style: TextStyle(
                                      color: ConstantsColor.greyColor,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Center(
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 52,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BloodBankScreen()));
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: ConstantsColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Text(
                                'BLOOD SEARCH',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
