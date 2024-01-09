import 'package:cureways_user/data/network/controllers/find_slot_controller.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/const_color.dart';
import '../../../utils/mixins.dart';
import '../../../widgets/appbar.dart';

class DoctorAppoinmentConfirmScreen extends StatefulWidget {
  int? doctorId;
  String? userName;
  DoctorAppoinmentConfirmScreen({Key? key, this.userName, this.doctorId})
      : super(key: key);

  @override
  State<DoctorAppoinmentConfirmScreen> createState() =>
      _DoctorAppoinmentConfirmScreenState();
}

class _DoctorAppoinmentConfirmScreenState
    extends State<DoctorAppoinmentConfirmScreen> {
  final TextEditingController _refferedDate = TextEditingController();
  FindSlotController findSlotController = FindSlotController();

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) {
      final formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      setState(() => _refferedDate.text = formattedDate.toString());
    }
  }

  @override
  void didChangeDependencies() {
    findSlotController = Get.put(FindSlotController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FindSlotController>(
      init: FindSlotController(),
      builder: (findSlot) => Scaffold(
        body: Container(
          color: ConstantsColor.backgroundColor,
          child: Column(
            children: [
              AppDefaultBar(
                  title: "BOOK AN APPOINMENT",
                  userNAme: widget.userName.toString()),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "REFERRED DATE ",
                          style: TextStyle(
                              color: ConstantsColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                controller: _refferedDate,
                                onTap: () {
                                  _selectDate();
                                },
                                keyboardType: TextInputType.text,
                                labelText: 'Referred Date',
                                hintText: 'Referred Date',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              findSlot.findSlotOnTap(
                                context,
                                widget.doctorId.toString(),
                                _refferedDate.text.toString().trim(),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: ConstantsColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: findSlot.loader == true
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : const Text(
                                    'NEXT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
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
