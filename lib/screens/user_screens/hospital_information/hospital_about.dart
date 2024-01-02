import 'package:flutter/material.dart';

import '../../../utils/const_color.dart';
class HospitalAbout extends StatefulWidget {
  const HospitalAbout({Key? key}) : super(key: key);

  @override
  State<HospitalAbout> createState() => _HospitalAboutState();
}

class _HospitalAboutState extends State<HospitalAbout> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: const [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"
                " laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderitLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"
                " laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderitLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"
                " laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
            style: TextStyle(
                color: ConstantsColor.greyColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 16,)
        ],
      ),
    );
  }
}
