import 'package:flutter/material.dart';

import '../../utils/const_color.dart';
class PribacyPolicyScreen extends StatefulWidget {
  const PribacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PribacyPolicyScreen> createState() => _PribacyPolicyScreenState();
}

class _PribacyPolicyScreenState extends State<PribacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 152,
        automaticallyImplyLeading: false,
        backgroundColor: ConstantsColor.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0)),
        ),
        title: const Column(
          children: [
            //SizedBox(height: 42,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WELCOME to CUREWAYS",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("PRIVACY POLICY",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 16,),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              Text("Effective Date:01.06.2023 ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                ),
              ),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              SizedBox(height: 32,),

              SizedBox(height: 16,),
              Text("Thank you for visiting CureWays. This Privacy Policy explains how we collect, use, disclose, and protect your personal information when you interact with our website and utilize our services. We are committed to safeguarding your privacy and ensuring the security of your personal data. By accessing our website or using our services, you agree to the terms of this Privacy Policy. ",

                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),

              SizedBox(height: 16,),
              Text("Information We Collect:",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                ),
              ),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              SizedBox(height: 16,),
              Text("a. Personal Information: We may collect personal information such as your name, contact details (email address, phone number, address), date of birth, and other relevant information when you voluntarily provide it to us."
                  "\nb. Medical Information: To provide you with our services, we may collect medical information such as your medical history, treatment preferences, and other healthcare-related data that you provide to us."
                  "\nc. Usage Information: We may collect non-personal information about your interactions with our website and services, including IP address, browser type, device information, pages visited, and referring/exit pages."
                  "\nd. Cookies and Tracking Technologies: We may use cookies and similar technologies to enhance your browsing experience and collect information about your usage patterns on our website.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Use of Information:",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                ),
              ),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              SizedBox(height: 16,),
              Text("a. The CureWays website and its content are the property of CureWays and are protected by copyright, trademark, and other intellectual property laws."
                  "\nb. You may not reproduce, distribute, modify, transmit, or use any part of the website without the prior written consent of CureWays",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Third-Party Links:",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                ),
              ),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              SizedBox(height: 16,),
              Text("a. Provide and Improve Services: We use the information collected to provide you with our services, including facilitating medical appointments, coordinating travel arrangements, and improving the quality of our services."
                  "\nb. Personalization: We may use your information to personalize your experience and provide you with relevant content and recommendations."
                  "\nc. Communication: We may use your contact information to communicate with you, respond to your inquiries, send updates about our services, and provide important notifications."
              "\nd. Analytics and Research: We may analyze usage data to improve our website, services, and user experience. Such analysis may be conducted using aggregated or anonymized information..",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Information Sharing and Disclosure:",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                ),
              ),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              SizedBox(height: 16,),
              Text("a. Service Providers: We may share your personal information with trusted service providers who assist us in delivering our services, such as healthcare providers, travel agencies, and diagnostic labs. These service providers are obligated to protect your information and may only use it to provide services on our behalf."
                 " \nb. Legal Compliance: We may disclose your personal information if required by law, regulation, or legal process, or if we believe it is necessary to protect our rights, property, or safety, or the rights, property, or safety of others."
                  "\nc. Consent: We will obtain your consent before sharing your personal information with third parties for purposes other than those outlined in this Privacy Policy."
                  ,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Data Security:",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                ),
              ),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              SizedBox(height: 16,),
              Text("a. We employ industry-standard security measures to protect your personal information from unauthorized access, use, or disclosure. However, please note "
                  "that no method of transmission over the Internet or electronic storage is 100% secure, and we cannot guarantee absolute security of your data."
                  "\nb. We retain your personal information for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Your Choices and Rights:",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                ),
              ),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              SizedBox(height: 16,),
              Text("a. Access and Correction: You have the right to access, correct, or update your personal information. You can do so by contacting us using the contact details provided below."
                 "\nb. Opt-Out: You may choose to opt out of receiving promotional communications from us by following the instructions in the communication or by contacting us."
                 "\n c. Cookies: You can manage your cookie preferences through your browser settings. Please note that disabling cookies may limit your access to certain features of our website.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Children's Privacy:",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                ),
              ),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              SizedBox(height: 16,),
              Text("CureWays' services are not directed towards individuals under the age of 18. We do not knowingly collect or maintain personal information from children. If we become aware that we have inadvertently removed it.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 32,),

            ],
          ),
        ),
      ),
    );;
  }
}
