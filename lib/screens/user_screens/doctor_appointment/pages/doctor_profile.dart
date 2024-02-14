import 'package:cureways_user/data/network/controllers/doctor_appoinment_controller.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/doctor_appoinment_confirm_screen.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/doctor_appoinment_screen.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:cureways_user/widgets/network_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorProfile extends StatefulWidget {
  final int index;
  const DoctorProfile(
    this.index, {
    super.key,
  });

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    var data = Get.find<DoctorAppoinmentController>().doctorList![widget.index];
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Doctor Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // profile
            50.height,
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(800),
                  child: Container(
                      color: kTextColorLight.withOpacity(.2),
                      child: const NetworkImg(
                        '',
                        width: 100,
                        height: 100,
                      ))),
            ),
            // name
            8.height,
            Center(
                child: Text(
              data.user.name,
              style: kTitleLarge.copyWith(fontWeight: FontWeight.w700),
            )),
            // Hospital name
            Center(
                child: SizedBox(
              width: 260.w,
              child: Text(
                data.hospital.name,
                style: kBodyLarge,
                textAlign: TextAlign.center,
              ),
            )),
            16.height,
            Center(
              child: PrimaryBtn(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const Text("Appointment"),
                onPressed: () {
                    Get.to(() => DoctorAppoinmentConfirmScreen(doctorId:data.id,));
                },
              ),
            ),
            55.height,
            Text(
                "About",
                style: kHeadlineMedium,

              ),
                Text(
                data.description,
                style: kBodyLarge,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
              12.height,
              Row(children: [
                  Text(
                "Email: ",
                style: kLabelLarge,

              ),
                Text(
                data.user.email,
                style: kBodyLarge,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
              ],)
          ],
        ),
      ),
    );
  }
}
