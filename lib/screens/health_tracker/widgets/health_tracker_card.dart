import 'package:cureways_user/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthTrackerCard extends StatelessWidget {
  final String title;
  final void Function()? onList;
  final void Function()? onAdd;
  const HealthTrackerCard(
      {super.key, required this.title, this.onList, this.onAdd});

  @override
  Widget build(BuildContext context) {
    double height = 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        // !Diet row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onAdd,
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 14), // x, y offset
                          blurRadius: 34,
                          spreadRadius: 0,
                          color: Color.fromARGB(255, 234, 241,
                              253), // Replace with your desired color
                        ),
                      ]),
                  // height: 100,
                  // width: 80,
                  child: Center(
                    child: Icon(
                      Icons.add_circle_sharp,
                      size: 32.sp,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: GestureDetector(
                onTap: onList,
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 14), // x, y offset
                          blurRadius: 34,
                          spreadRadius: 0,
                          color: Color.fromARGB(255, 234, 241,
                              253), // Replace with your desired color
                        ),
                      ]),
                  height: height,
                  // width: 80,
                  child: const Center(
                    child: Text(
                      "See List",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
