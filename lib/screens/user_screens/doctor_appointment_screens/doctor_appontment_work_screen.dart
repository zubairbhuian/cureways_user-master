import 'package:flutter/material.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';

class DoctorAppointmentWorkScreen extends StatefulWidget {
// String userName;
  DoctorAppointmentWorkScreen({Key? key}) : super(key: key);

  @override
  State<DoctorAppointmentWorkScreen> createState() =>
      _DoctorAppointmentWorkScreenState();
}

class _DoctorAppointmentWorkScreenState
    extends State<DoctorAppointmentWorkScreen> {
  // dynamic userName;
  // @override
  // void initState() {
  //   userName=widget.userName;
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppDefaultBar(title: "VIRTUAL LAB", userNAme: ''),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "At CureWays, we offer a seamless and convenient way for individuals to schedule doctor appointments, both domestically and internationally. We understand that finding the right doctor and booking appointments can be time-consuming and challenging, especially when seeking specialized care or exploring medical tourism options. Our streamlined process simplifies the entire experience, ensuring that you receive the medical attention you need efficiently and effectively.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Standard Operating Procedure (SOP) for Doctor Appointments:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Request and Consultation:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor),
                    ),
                    Divider(
                      height: 4,
                      thickness: 1,
                      color: ConstantsColor.primaryColor,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "a. Visit our website or contact our dedicated customer service team to request a doctor's appointment."
                      "\nb. Provide relevant information, including your medical history, symptoms, and any specific preferences or requirements.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Assessment and Recommendations:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor),
                    ),
                    Divider(
                      height: 4,
                      thickness: 1,
                      color: ConstantsColor.primaryColor,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "a. Our experienced team reviews your request and assesses the best available options based on your needs."
                      "\nb. We provide you with personalized recommendations, including information about suitable doctors, úmedical facilities, and appointment availability.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Appointment Confirmation:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor),
                    ),
                    Divider(
                      height: 4,
                      thickness: 1,
                      color: ConstantsColor.primaryColor,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "a. Once you choose a preferred doctor and appointment time, we coordinate with the healthcare provider to secure your appointment."
                      "\nb. We confirm the appointment details and provide you with the necessary information, including date, time, location, and any specific instructions.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Travel Assistance (if applicable):",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor),
                    ),
                    Divider(
                      height: 4,
                      thickness: 1,
                      color: ConstantsColor.primaryColor,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "a. For international appointments, we offer comprehensive travel assistance services, including visa invitation letters, travel arrangements, and accommodation recommendations."
                      "\nb. We ensure that you have all the necessary information and support for a smooth travel experience.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Appointment Reminders:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor),
                    ),
                    Divider(
                      height: 4,
                      thickness: 1,
                      color: ConstantsColor.primaryColor,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "a. We send you timely reminders about your upcoming appointment, ensuring that you are well-prepared and informed."
                      "\nb. Reminders may be sent via email, SMS, or through our dedicated patient portal.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Appointment Follow-up:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor),
                    ),
                    Divider(
                      height: 4,
                      thickness: 1,
                      color: ConstantsColor.primaryColor,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "a. After your appointment, we follow up to gather feedback on your experience and address any concerns or additional needs you may have."
                      "\nb. We value your feedback and use it to continuously improve our services and enhance the patient experience.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "At CureWays, we prioritize your convenience, comfort, and well-being throughout the doctor appointment process. Our commitment to quality healthcare and personalized service ensures that you receive the best possible care, tailored to your unique requirements.",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Contact us today to schedule your doctor appointment and let us guide you towards optimal health and well-being with our efficient and reliable services.",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
