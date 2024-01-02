
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
class OverseasTreatmentWorksScreen extends StatefulWidget {
  String userName;
 OverseasTreatmentWorksScreen({Key? key,
 required this.userName}) : super(key: key);

  @override
  State<OverseasTreatmentWorksScreen> createState() => _OverseasTreatmentWorksScreenState();
}

class _OverseasTreatmentWorksScreenState extends State<OverseasTreatmentWorksScreen> {
 dynamic userName;
 @override
  void initState() {
   userName= widget.userName;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        AppDefaultBar(title:"OverseasTreatment", userNAme: userName),
       const Expanded(
         child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Overseas Treatment: Accessing World-Class Healthcare Beyond Borders",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.primaryColor
                  ),
                  ),
                  SizedBox(height: 16,),
                  Text("CureWays specializes in facilitating overseas treatment, offering individuals the opportunity to access world-class healthcare services globally. We understand that some medical conditions require specialized expertise or advanced treatment options that may not be readily available in their home country. Our comprehensive Overseas Treatment program aims to connect patients with renowned medical institutions abroad, ensuring they receive the best possible care and treatment.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Standard Operating Procedure (SOP) for Overseas Treatment:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ConstantsColor.primaryColor
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Initial Assessment and Consultation:",
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
                  Text("a. Contact our Overseas Treatment team to discuss your medical condition, treatment requirements, and preferences."
                      "\nb. Provide relevant medical reports and diagnostic information to aid in the assessment process.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Medical Evaluation and Recommendations:",
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
                  Text("a. Our team of medical experts reviews your case, considering your unique needs and treatment options."
                     "\nb. We collaborate with renowned healthcare institutions abroad to obtain expert opinions and personalized treatment plans.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Treatment Proposal and Cost Estimate:",
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
                  Text("a. Based on the medical evaluation, we provide you with a detailed treatment proposal, including recommended healthcare providers, treatment options, and estimated costs."
                      "\nb. We ensure transparency and discuss the available financing options and payment procedures.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Travel and Logistics:",
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
                  Text("a. Once you approve the treatment plan, we assist with travel arrangements, including flights, accommodation, and transportation."
                      "\nb. Our team provides guidance on visa requirements, necessary documentation, and any additional logistics involved.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Appointments and Treatment:",
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
                  Text("a. We coordinate with the chosen healthcare facility to secure appointments and arrange for your admissionion."
                      "\nb. Throughout your treatment journey, our team remains in contact, ensuring seamless communication between you, the healthcare providers, and any necessary caregivers..",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Post-Treatment Follow-up:",
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
                  Text("a. After completion of the treatment, we facilitate post-treatment consultations, if required."
                      "\nb. We assist with medical reports, discharge summaries, and follow-up care instructions for continued treatment in your home country, if applicable..",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Our Overseas Treatment program is designed to provide you with comprehensive support and guidance throughout the entire process. We understand that seeking treatment abroad can be a significant decision, and we strive to make it as smooth and comfortable as possible.",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text("Contact us today to explore the possibilities of overseas treatment, and let us assist you in accessing world-class healthcare beyond borders.",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 32,),

                ],
              ),
            ),
          ),
       )
      ],
    ),);
  }
}

