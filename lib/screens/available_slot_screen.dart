import 'package:cureways_user/data/network/models/find_slot_model.dart';
import 'package:cureways_user/screens/user_screens/doctor_appointment/doctor_appoinment_screen.dart';
import 'package:cureways_user/utils/const_color.dart';
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
      appBar: AppBar(
        toolbarHeight: 152,
        automaticallyImplyLeading: false,
        backgroundColor: ConstantsColor.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0)),
        ),
        title: Column(
          children: [
            //SizedBox(height: 42,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hi,",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        "Welcome back",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                SvgPicture.asset(
                  "assets/home_screen/bell.svg",
                  height: 32,
                  width: 32,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AVAILABLE SLOT',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
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
