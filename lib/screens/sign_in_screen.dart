import 'package:cureways_user/screens/sign_up/sign_up_screen.dart';
import 'package:cureways_user/screens/user_screens/main_board_check.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../utils/const_color.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _mobileEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late final  user;
  String userMobileNumber = '';
  String createPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Column(
        children:  [
          const Padding(
            padding: EdgeInsets.only(top: 185,left: 113,right: 113),
            child: Text("Sign in",
              style: TextStyle(
                  color: ConstantsColor.primaryColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 16,),
          const Padding(
            padding: EdgeInsets.only(left:16,right: 16),
            child: Text(
              "By signing in you are agree to our terms & Conditions. please provide you accurate information to log in to your account",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
          const SizedBox(height: 64,),
          Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.only(left: 22,right: 22),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _mobileEmailController,
                      keyboardType: TextInputType.text,
                        labelText: 'Enter your phone number or email',
                        hintText: 'Enter your phone number or email',
                    ),
                    CustomTextField(
                      controller:_passwordController,
                      keyboardType: TextInputType.text,
                        labelText:  'Enter your password',
                        hintText: 'Enter your password',
                    ),

                  ],

                ),
              )),
          const SizedBox(height: 23,),
          Padding(
            padding: const EdgeInsets.only(left: 22,right: 22),
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
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 22,right: 22,top: 00,bottom: 00),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Remember Me" ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: -1,
                      fontSize: 14,
                      color: Color(0xff8F8F8F)
                  ),
                ),
                TextButton(onPressed: (){}, child: const Text(
                  "Forget password?" ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: -1,
                      fontSize: 14,
                      color: ConstantsColor.primaryColor
                  ),
                ),)

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?" ,
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: -3,
                    fontSize: 14,
                    color: Color(0xff8F8F8F),
                    fontWeight: FontWeight.w600
                ),
              ),
              TextButton(
                onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
              }, child: const Text(
                "Create" ,
                textAlign: TextAlign.center,
                style: TextStyle(

                    height: -3,
                    fontSize: 14,
                    color: ConstantsColor.primaryColor
                ),
              ),)

            ],
          ),
          //const SizedBox(height: 8,),

        ],
      ),
    );
  }
}
