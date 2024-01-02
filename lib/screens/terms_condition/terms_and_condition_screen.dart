import 'package:flutter/material.dart';

import '../../utils/const_color.dart';
class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionScreen> createState() => _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
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
                Text("TERMS AND CONDITIONS",
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
              Text("Please read these Terms and Conditions carefully before using the CureWays website. Your access to and use of the website is conditioned upon your "
                  "acceptance of and compliance with these Terms and Conditions. By accessing or using the website, you agree to be bound by these Terms and Conditions. If you do not agree with any part of these Terms and Conditions, you may not access the website",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),

              SizedBox(height: 16,),
              Text("Use of the Website:",
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
              Text("a. The content provided on the CureWays website is for general informational purposes only. It is subject to change without notice."
                 "\nb. The use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services, or information available through this website meet your specific requirements."
                 "\nc. Unauthorized use of this website may give rise to a claim for damages and/or be a criminal offense.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Intellectual Property:",
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
              Text("a. The CureWays website may contain links to third-party websites that are not owned or controlled by CureWays. These links are provided for your convenience and do not signify our endorsement of those websites."
                 "\nb. We have no control over the nature, content, and availability of the linked websites. We are not responsible for the content, privacy practices, or any other aspect of third-party websites.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Limitation of Liability:",
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
              Text("a. CureWays and its directors, employees, agents, and affiliates shall not be liable for any direct, indirect, incidental, consequential, or special damages arising out of or in connection with your use of the website or reliance on its content."
                 "\nb. CureWays does not warrant or make any representations regarding the accuracy, reliability, or availability of the website or its content.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Indemnification:",
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
              Text("You agree to indemnify and hold harmless CureWays, its directors, employees, agents, and affiliates from and against any claims, liabilities, damages, losses, or expenses, including reasonable attorneys' fees, arising out of or in connection with your use of the website or violation of these Terms and Conditions.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Governing Law:",
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
              Text("These Terms and Conditions shall be governed by and construed in accordance with the laws of [insert jurisdiction]. Any disputes arising under or in connection with these Terms and Conditions shall be subject to the exclusive jurisdiction of the courts of [insert jurisdiction].",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Modifications:",
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
              Text("CureWays reserves the right to modify or replace these Terms and Conditions at any time without prior notice. The updated version of the Terms and Conditions will be effective upon posting on the website. Your continued use of the website after any modifications constitutes your acceptance of the revised Terms and Conditions..",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 32,),
              Text("If you have any questions or concerns about these Terms and Conditions, please contact us using the contact details provided.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Divider(height: 4,
                thickness: 1,
                color: ConstantsColor.primaryColor,
              ),
              Text("Last updated:01 June 2023",
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

            ],
          ),
        ),
      ),
    );
  }
}
