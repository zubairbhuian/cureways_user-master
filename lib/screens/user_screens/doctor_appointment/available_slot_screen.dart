import 'package:cureways_user/data/network/models/find_slot_model.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/doctor_appoinment_screen.dart';
import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AvailableSlotScreen extends StatefulWidget {
  final String? doctorId;
  final List<FindSlotData> slotDataList;
  const AvailableSlotScreen(
      {super.key, this.doctorId, required this.slotDataList});

  @override
  State<AvailableSlotScreen> createState() => _AvailableSlotScreenState();
}

class _AvailableSlotScreenState extends State<AvailableSlotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Available Slot"),),  
      body: widget.slotDataList.isEmpty
          ? const Center(
              child: Text(
                'No Slot Available',
                style: TextStyle(fontSize: 24),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: widget.slotDataList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(() => DoctorAppointmentScreen(
                          doctorId: widget.doctorId,
                          slotId: widget.slotDataList[index].id.toString(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: ConstantsColor.backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                            "Slot: ${widget.slotDataList[index].slotFrom}-${widget.slotDataList[index].slotTo}"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
