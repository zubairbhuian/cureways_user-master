import 'package:flutter/material.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';
class AmbulanceWorksScreen extends StatefulWidget {
  String userName;
  AmbulanceWorksScreen({Key? key,required this.userName}) : super(key: key);

  @override
  State<AmbulanceWorksScreen> createState() => _AmbulanceWorksScreenState();
}

class _AmbulanceWorksScreenState extends State<AmbulanceWorksScreen> {
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
          AppDefaultBar(title:"AMBULANCE", userNAme: userName),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Ambulance Service: Swift and Reliable Emergency Medical Assistance",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("CureWays provides a professional and efficient Ambulance Service to ensure prompt medical care during emergencies. Our dedicated team of trained paramedics and state-of-the-art ambulances are equipped to handle critical situations and transport patients safely to healthcare facilities. With our Ambulance Service, we prioritize your well-being and strive to deliver swift and reliable medical assistance when you need it the most.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Standard Operating Procedure (SOP) for Ambulance Service:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Emergency Call:",
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
                    Text("a. Dial our designated emergency helpline number to request an ambulance."
                        "\nb. Provide essential information about the emergency situation, including the location, nature of the medical condition, and any specific requirements or instructions.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Dispatch and Response:",
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
                    Text("a. Our emergency response team promptly dispatches the nearest available ambulance equipped with advanced life-support systems and medical equipment."
                        "\nb. The team coordinates with the caller to gather additional details, assess the severity of the situation, and provide initial medical guidance, if applicable.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("On-site Medical Assistance:",
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
                    Text("a. The ambulance arrives at the location and our trained paramedics promptly assess and stabilize the patient."
                        "\nb. Depending on the medical condition, necessary medical interventions are initiated, including first aid, administering medications, and cardiac life support.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Patient Transportation:",
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
                    Text("a. The ambulance team maintains constant communication with the healthcare facility to inform them about the patient's condition and estimated time of arrival."
                        "\nb. Updates are provided to the patient's family or emergency contacts, ensuring transparency and reassurance during the transport process.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Safe Handover at Healthcare Facility:",
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
                    Text("a. The ambulance team coordinates with the receiving healthcare facility to ensure a smooth handover of the patient."
                        "\nb. Relevant medical information and documentation are handed over to the healthcare professionals for seamless continuation of medical care.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Our Ambulance Service follows stringent protocols and adheres to all safety and medical standards to provide timely and effective emergency medical assistance. We understand the critical nature of emergencies and prioritize swift response and expert care to enhance the chances of positive outcomes.",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 32,),
                    Text("Contact our dedicated emergency helpline to access our reliable Ambulance Service and rest assured that you will receive professional medical assistance during times of emergencies.",
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
