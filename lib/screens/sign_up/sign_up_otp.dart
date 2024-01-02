import 'package:flutter/material.dart';

import '../../utils/const_color.dart';
import '../user_screens/main_board_check.dart';

class SignUpOtp extends StatefulWidget {
  const SignUpOtp({Key? key}) : super(key: key);

  @override
  State<SignUpOtp> createState() => _SignUpOtpState();
}

class _SignUpOtpState extends State<SignUpOtp> {
  final TextEditingController _otpController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late final user;
  String userOtp = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 280.0),
          child: Column(
            children: [
              Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _otpController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.phone),
                            labelText: 'Enter your OTP ',
                            hintText: 'Enter your OTP ',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal),
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Center(
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainBoardCheck(userInfo: user,)));
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: ConstantsColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
