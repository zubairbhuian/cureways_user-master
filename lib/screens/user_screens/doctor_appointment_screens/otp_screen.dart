import 'package:cureways_user/screens/user_screens/doctor_appointment_screens/doctor_appoinment_confirm_screen.dart';
import 'package:flutter/material.dart';

import '../../../utilis/const_color.dart';
import '../../../widgets/appbar.dart';

class DoctorAppoinmentOtpScreen extends StatefulWidget {
  const DoctorAppoinmentOtpScreen({Key? key}) : super(key: key);

  @override
  State<DoctorAppoinmentOtpScreen> createState() =>
      _DoctorAppoinmentOtpScreenState();
}

class _DoctorAppoinmentOtpScreenState extends State<DoctorAppoinmentOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstantsColor.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppDefaultBar(title: "BOOK AN APPOINTMENT", userNAme: " userNAme"),
            Padding(
              padding: const EdgeInsets.only(top: 170, left: 16, right: 16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: OutlinedButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorAppoinmentOtpScreen()));
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                                width: 1.0, color: ConstantsColor.greyColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            'Validate OTP',
                            style: TextStyle(
                                color: ConstantsColor.greyColor, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DoctorAppoinmentConfirmScreen()));
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: ConstantsColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            'Submit OTP',
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
      ),
    );
  }
}
