import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';
class VirtualLabWorkScreen extends StatefulWidget {
  String userName;
 VirtualLabWorkScreen({Key? key,required this.userName}) : super(key: key);

  @override
  State<VirtualLabWorkScreen> createState() => _VirtualLabWorkScreenState();
}

class _VirtualLabWorkScreenState extends State<VirtualLabWorkScreen> {
  dynamic userName;
  @override
  void initState() {
    userName=widget.userName;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppDefaultBar(title:"VIRTUAL LAB", userNAme: userName),
           Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(left: 20.w, right: 20.w,top: 12),
                child: const Column(
                  children: [
                    Text("Virtual Lab: Revolutionizing Healthcare Diagnostics",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("CureWays introduces Virtual Lab, a cutting-edge technology that brings diagnostic laboratory services directly to your doorstep. Our Virtual Lab service leverages advanced digital platforms and skilled professionals to provide convenient and reliable diagnostic testing, enabling you to monitor your health from the comfort of your own home. With Virtual Lab, healthcare diagnostics have never been more accessible and efficient.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Standard Operating Procedure (SOP) for Virtual Lab:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Sample Collection:",
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
                    Text("a. Request a Virtual Lab service through our website or customer service helpline."
                        "\nb. Provide necessary information, including the type of test required and your preferred date and time for sample collection.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Sample Collection Appointment:",
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
                    Text("a. Our trained phlebotomists will visit your location at the scheduled appointment time."
                        "\nb. They will collect the required samples using sterilized equipment and following proper safety protocols.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Sample Transportation:",
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
                    Text("a. Collected samples are carefully packaged and transported to our accredited partner laboratories using specialized cold chain logistics, if necessary."
                        "\nb. We ensure proper handling and transportation conditions to maintain sample integrity and accuracy.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Laboratory Testing:",
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
                    Text("a. Our skilled paramedics carefully transfer the patient to the ambulance, ensuring their comfort and safety throughout the process."
                        "\nb. Medical equipment and monitoring devices are used to continuously assess and monitor vital signs during transportation.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Communication and Coordination:",
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
                    Text("a. Samples are processed and tested at our partner laboratories by skilled technicians and under stringent quality control measures."
                        "\nb. Our partner laboratories are equipped with state-of-the-art equipment and technologies to deliver accurate and reliable results.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Result Delivery:",
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
                    Text("a. Once the laboratory testing is completed, we promptly deliver the test results to you via your preferred communication method, such as email, SMS, or our secure online portal."
                        "\nb. Results are presented in a clear and understandable format, providing you with comprehensive insights into your health status.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Consultation and Follow-up:",
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
                    Text("a. If required, we offer consultation services with qualified healthcare professionals who can interpret and explain the test results in detail."
                        "\nb. Our healthcare experts can provide guidance, answer your queries, and recommend appropriate next steps based on the test findings.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Virtual Lab empowers you to take control of your health by eliminating the need to visit a physical laboratory or clinic. With our advanced technology and dedicated professionals, you can access high-quality diagnostic services with ease and convenience.",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 32,),
                    Text("Contact us today to experience the benefits of Virtual Lab and discover a new level of healthcare diagnostics from the comfort of your home.",
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
