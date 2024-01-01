import 'package:flutter/material.dart';

import '../../utilis/const_color.dart';
class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);

  @override
  State<DisclaimerScreen> createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
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
                Text("DISCLAIMER",
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
              Text("The information provided on the CureWays website is for general informational purposes only. While we strive to keep the information up to date and accurate, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability with respect to the "
                  "website or the information, products, services, or related graphics contained on the website for any purpose."
           ,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),

              SizedBox(height: 16,),
              Text("Medical Disclaimer:",
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
              Text("The content on the CureWays website is not intended to be a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or qualified healthcare provider with any questions you may have regarding a medical condition. Never disregard professional medical advice or delay in seeking it because of something you have read on this website.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Healthcare Providers:",
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
              Text("CureWays acts solely as a facilitator to connect patients with h"
                  "ealthcare providers, medical facilities, and related services. We"
                  " do not endorse or recommend any specific healthcare provider, treatment, or medical facility. The choice of a healthcare provider or medical facility is solely "
                  "the responsibility of the patient.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Medical Tourism:",
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
              Text("CureWays provides information and assistance for medical tourism purposes. However, we do not assume any liability for the medical services provided by healthcare providers or medical facilities in any country. Patients are advised to thoroughly research and evaluate the credentials, qualifications, and reputation of healthcare providers and medical facilities before making any decisions.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Travel and Visa:",
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
              Text("While we strive to provide accurate information and assistance regarding travel arrangements and visa requirements, it is the responsibility of the individual to ensure compliance with the applicable travel and immigration regulations. CureWays is not liable for any issues or complications related to travel, visas, or immigration.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Third-Party Websites:",
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
              Text("The CureWays website may contain links to third-party websites that are not under our control. These links are provided for convenience and informational purposes only. We have no control over the nature, content, and availability of those sites. The inclusion of any links does not necessarily imply a recommendation or endorsement of the views expressed within them.",
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
              Text("In no event will CureWays be liable for any loss or damage, including without limitation, indirect or consequential loss or damage, or any loss or damage arising from the use of this website, or any linked third-party website.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("Every effort is made to keep the website up and running smoothly. However, CureWays takes no responsibility for, and will not be liable for, the website being temporarily unavailable due to technical issues beyond our control.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("By using the CureWays website, you agree to the terms of this disclaimer.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 16,),
              Text("If you have any questions or concerns about the information provided on this website, please contact us using the contact details provided.",
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
              Text("Last updated: 01.06.2023 ",
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
