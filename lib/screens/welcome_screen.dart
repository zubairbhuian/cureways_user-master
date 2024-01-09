import 'package:cureways_user/data/network/controllers/social_login_controller.dart';
import 'package:cureways_user/screens/disclaimer/disclaimer_Screen.dart';
import 'package:cureways_user/screens/pribacy_policy/pribacy_policy_screen.dart';
import 'package:cureways_user/screens/terms_condition/terms_and_condition_screen.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../social_sig_in/google_sig_in.dart';
import '../utils/const_color.dart';

class WelcomescreenCheck extends StatefulWidget {
  const WelcomescreenCheck({Key? key}) : super(key: key);

  @override
  State<WelcomescreenCheck> createState() => _WelcomescreenCheckState();
}

class _WelcomescreenCheckState extends State<WelcomescreenCheck> {
  SocialLoginController socialLoginController = SocialLoginController();

  @override
  void didChangeDependencies() {
    socialLoginController = Get.put(SocialLoginController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (_, constraints) {
        final width = constraints.biggest.width;
        final height = constraints.biggest.height;
        return GetBuilder<SocialLoginController>(
          init: SocialLoginController(),
          builder: (auth) => Stack(
            children: <Widget>[
              const Positioned(
                right: -8,
                top: -8,
                child: Image(
                  image: AssetImage("assets/home_screen/ellipse_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: -8,
                top: -10,
                child: SvgPicture.asset(
                  "assets/welcome_screen/Ellipse 2.svg",
                  fit: BoxFit.cover,
                  color: ConstantsColor.primaryColor,
                ),
              ),
              const Positioned(
                  right: 00,
                  top: 50,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "WELCOME",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "TO",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "VIRTUAL HEALTHCARE SERVICE",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
              const Positioned(
                  right: 00,
                  top: 105,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text(
                      "CURE WAYS",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Positioned(
                left: width * 0.15,
                top: height * 0.15,
                child: const Image(
                  image: AssetImage("assets/home_screen/Logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: width * .125,
                right: width * .125,
                top: height * .32,
                child: const Image(
                  image: AssetImage("assets/welcome_screen/doctor-visit 1.png"),
                  fit: BoxFit.cover,
                ),
              ),

              /*  Positioned(
                left: width *.225,
                top: height*.38,
                child: const Image(
                  image: AssetImage("assets/home_screen/Ellipse 17.png"),
                  fit: BoxFit.cover,
                ),
              ),
               Positioned(
                left:width *.243,
                top:  height*.39,
                child: const Image(
                  image: AssetImage("assets/home_screen/Ellipse 16.png"),
                  fit: BoxFit.cover,
                ),
              ),
       Positioned(
                left:width *.243,
                top: height*.325,
                child: const Image(
                  image: AssetImage("assets/welcome_screen/welcome_doctor.png"),
                  height: 267,
                  width:224 ,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: width *.24,
                top: height*.39,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage("assets/welcome_screen/welcome_drop_of_blood.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
               Positioned(
                 left: width *.66,
                 top: height*.39,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage("assets/welcome_screen/welcome_microscope.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
       Positioned(
                left:  width *.18,
                top: height*.47,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage("assets/welcome_screen/welcome_pill.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          Positioned(
                left: width *.75,
            top: height*.47,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage("assets/welcome_screen/welcome_ask_doctor.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Positioned(
                left:  width *.19,
                top:  height*.55,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage("assets/welcome_screen/welcome_pharma.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: width *.75,
                top:  height*.55,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage("assets/welcome_screen/welcome_planner.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

               const Positioned(
              left: 105,
              top: 160,
              child: Image(
                image: AssetImage("assets/welcome_screen/Illustration.png"),
                fit: BoxFit.cover,
              ),
            ),*/
              Positioned(
                left: width * 00,
                right: width * 00,
                top: height * .70,
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 12, right: 12),
                    //   child: SizedBox(
                    //     height: 50,
                    //     width: double.maxFinite,
                    //     child: OutlinedButton(
                    //       onPressed: () {
                    //         Navigator.of(context).push(MaterialPageRoute(
                    //             builder: (context) => const SignUpScreen()));
                    //       },
                    //       style: OutlinedButton.styleFrom(
                    //         backgroundColor: ConstantsColor.primaryColor,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(5),
                    //         ),
                    //       ),
                    //       child: const Text(
                    //         ' Sign Up ',
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // const Text(
                    //   "Or continue With",
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500,
                    //       color: Color(0xff8F8F8F)),
                    // ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () async {
                                  final user = await GoogleSignInApi.login();
                                  kLogger.e(user?.photoUrl);
                                  if (user == null) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar((const SnackBar(
                                      content: Text("Sign In failed"),
                                    )));
                                  } else {
                                    auth.loginOnTap(context, user.displayName,
                                        user.email, user.photoUrl);
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1.0,
                                      color: ConstantsColor.primaryColor),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          "assets/welcome_screen/Google.png",
                                        ),
                                        height: 40,
                                        width: 40,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Google',
                                        style: TextStyle(
                                            color: ConstantsColor.primaryColor,
                                            fontSize: 26),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const VerticalDivider(width: 25,),
                          /*   Expanded(
                              child: SizedBox(
                                width: double.maxFinite,
                                height: 56,
                                child: OutlinedButton(
                                  onPressed: () {

                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(width: 1.0, color: ConstantsColor.primaryColor),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Image(image: AssetImage("assets/welcome_screen/Facebook.png")),

                                      Text(
                                        'Facebook',
                                        style: TextStyle(
                                            color:  ConstantsColor.primaryColor, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),*/
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // const Text(
                    //   "OR",
                    //   textAlign: TextAlign.center,
                    //   style:
                    //       TextStyle(fontSize: 14, color: Color(0xff8F8F8F)),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       "Already Have an Account?",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //           height: -1,
                    //           fontSize: 14,
                    //           color: Color(0xff8F8F8F)),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.of(context).push(MaterialPageRoute(
                    //             builder: (context) => const SignInScreen()));
                    //       },
                    //       child: TextButton(
                    //         onPressed: () {},
                    //         child: const Text(
                    //           "Sign In",
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //               height: -1,
                    //               fontSize: 14,
                    //               color: ConstantsColor.primaryColor),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Positioned(
                top: height * .80,
                left: 14,
                child: SizedBox(
                  width: 360.w,
                  child: RichText(
                      text: TextSpan(
                          text: "Terms & Condition ",
                          style:
                              TextStyle(color: kPrimaryColor, fontSize: 14.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const TermsAndConditionScreen()));
                            },
                          children: [
                        TextSpan(
                          text: " And ",
                          style: TextStyle(color: kTextColor, fontSize: 14.sp),
                        ),
                        TextSpan(
                          //Disclaimer
                          text: " Privacy Policy ",
                          style:
                              TextStyle(color: kPrimaryColor, fontSize: 14.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const PribacyPolicyScreen()));
                            },
                        ),
                        TextSpan(
                          text: " And ",
                          style: TextStyle(color: kTextColor, fontSize: 14.sp),
                        ),
                        TextSpan(
                          //Disclaimer
                          text: " Disclaimer",
                          style:
                              TextStyle(color: kPrimaryColor, fontSize: 14.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DisclaimerScreen()));
                            },
                        )
                      ])),
                  // child: Wrap(
                  //   // mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) =>
                  //                 const TermsAndConditionScreen()));
                  //       },
                  //       child: const Text(
                  //         "Terms & Condition",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //             height: -1,
                  //             fontSize: 14,
                  //             color: ConstantsColor.primaryColor),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 4,
                  //     ),
                  //     const Text(
                  //       "And",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           height: -1, fontSize: 14, color: Colors.black),
                  //     ),
                  //     const SizedBox(
                  //       width: 4,
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => const PribacyPolicyScreen()));
                  //       },
                  //       child: const Text(
                  //         "Privacy Policy",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //             height: -1,
                  //             fontSize: 14,
                  //             color: ConstantsColor.primaryColor),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 4,
                  //     ),
                  //     const Text(
                  //       "And",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           height: -1, fontSize: 14, color: Colors.black),
                  //     ),
                  //     const SizedBox(
                  //       width: 4,
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => const DisclaimerScreen()));
                  //       },
                  //       child: const Text(
                  //         "Disclaimer",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //             height: -1,
                  //             fontSize: 14,
                  //             color: ConstantsColor.primaryColor),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  // Future googleSignIn() async {
  //   final user = await GoogleSignInApi.login();
  //   if (user == null) {
  //     ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
  //       content: Text("Sign In failed"),
  //     )));
  //   } else {
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => MainBoardCheck(
  //               userInfo: user,
  //             )));
  //   }
  // }
}
