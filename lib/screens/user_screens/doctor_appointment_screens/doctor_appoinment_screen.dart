import 'package:cureways_user/data/network/controllers/slot_booking_controller.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment_screens/doctor_appontment_work_screen.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/const_color.dart';
import '../../../utils/mixins.dart';
import '../../../widgets/appbar.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  final String? doctorId;
  final String? slotId;
  const DoctorAppointmentScreen({Key? key, this.doctorId, this.slotId})
      : super(key: key);

  @override
  State<DoctorAppointmentScreen> createState() =>
      _DoctorAppointmentScreenState();
}

class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  String patientType = '';
  String gender = '';

  SlotBookingController slotBookingController = SlotBookingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    slotBookingController = Get.put(SlotBookingController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlotBookingController>(
      init: SlotBookingController(),
      builder: (bookSlot) => Scaffold(
        body: Container(
          color: ConstantsColor.backgroundColor,
          child: Column(
            children: [
              AppDefaultBar(title: "BOOK AN APPOINTMENT", userNAme: ''),
              //  const SizedBox(height: 8,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Standard Operating Procedure (SOP) for Doctor Appointments:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ConstantsColor.primaryColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DoctorAppointmentWorkScreen()));
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: ConstantsColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              "How it works?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          height: 4,
                          thickness: 1,
                          color: ConstantsColor.primaryColor,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text("Book Now",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ConstantsColor.primaryColor,
                              // decoration: TextDecoration.underline
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        const Divider(
                          height: 4,
                          thickness: 1,
                          color: ConstantsColor.primaryColor,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: -2),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  buttonStyleData: const ButtonStyleData(
                                    height: 60,
                                    padding:
                                        EdgeInsets.only(left: 00, right: 10),
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    "PATIENT TYPE",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: ConstantsColor.primaryColor),
                                  ),
                                  items: Mixins()
                                      .patientType
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          )))
                                      .toList(),
                                  onChanged: (value) {
                                    // print('value => $value');
                                    patientType = value.toString();
                                  },
                                  onSaved: (value) {
                                    patientType = value.toString();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select Patient Type';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "PERSONAL DETAILS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: ConstantsColor.primaryColor),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextField(
                                  controller: bookSlot.nameController,
                                  keyboardType: TextInputType.text,
                                  labelText: 'Enter Your  Name',
                                  hintText: 'Enter Your  Name',
                                ),
                                CustomTextField(
                                  controller: bookSlot.ageController,
                                  keyboardType: TextInputType.text,
                                  labelText: 'Enter Your Age',
                                  hintText: 'Enter Your Age',
                                ),
                                CustomTextField(
                                  controller: bookSlot.weightController,
                                  keyboardType: TextInputType.text,
                                  labelText: 'Enter Your Weight',
                                  hintText: 'Enter Your Weight',
                                ),
                                CustomTextField(
                                  controller: bookSlot.locationController,
                                  keyboardType: TextInputType.text,
                                  labelText: 'Enter Your Location',
                                  hintText: 'Enter Your Location',
                                ),
                                CustomTextField(
                                  controller: bookSlot.phoneController,
                                  keyboardType: TextInputType.text,
                                  labelText: 'Enter Your Phone',
                                  hintText: 'Enter Your Phone Number',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: -2),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  buttonStyleData: const ButtonStyleData(
                                    height: 60,
                                    padding:
                                        EdgeInsets.only(left: 00, right: 10),
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    "Gender",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: ConstantsColor.primaryColor),
                                  ),
                                  items: Mixins()
                                      .patientGender
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          )))
                                      .toList(),
                                  onChanged: (value) {
                                    gender = value.toString();
                                  },
                                  onSaved: (value) {
                                    gender = value.toString();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select Gender';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              bookSlot.bookSlotOnTap(
                                context,
                                widget.doctorId,
                                widget.slotId,
                                patientType == 'New' ? 1 : 2,
                                bookSlot.nameController.text.toString().trim(),
                                bookSlot.ageController.text.toString().trim(),
                                bookSlot.weightController.text
                                    .toString()
                                    .trim(),
                                bookSlot.locationController.text
                                    .toString()
                                    .trim(),
                                bookSlot.phoneController.text.toString().trim(),
                                gender == 'Male'
                                    ? 1
                                    : gender == 'Female'
                                        ? 2
                                        : 3,
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: ConstantsColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: bookSlot.loader == true
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
