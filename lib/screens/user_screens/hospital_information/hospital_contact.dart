import 'package:flutter/material.dart';

import '../../../utils/const_color.dart';
class HospitalContact extends StatefulWidget {
  const HospitalContact({Key? key}) : super(key: key);

  @override
  State<HospitalContact> createState() => _HospitalContactState();
}

class _HospitalContactState extends State<HospitalContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 52,
          child: OutlinedButton(
            onPressed: () {
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: ConstantsColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              'CALL NOW',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 32,),
        SizedBox(
          width: double.maxFinite,
          height: 52,
          child: OutlinedButton(
            onPressed: () {
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: ConstantsColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              'E-MAIL',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
