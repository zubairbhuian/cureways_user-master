import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';
class AmbulanceDetailsScreen extends StatefulWidget {
  const AmbulanceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AmbulanceDetailsScreen> createState() => _AmbulanceDetailsScreenState();
}

class _AmbulanceDetailsScreenState extends State<AmbulanceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppDefaultBar(title: "AMBULANCE", userNAme: "userNAme"),
          const SizedBox(height: 12,),
          Padding(
            padding:  EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 228,
                  width: double.maxFinite,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: const Image(
                    image: AssetImage("assets/ambulance/ambulance_Image.png"),
                    height: 226,
                    width: double.maxFinite,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 16,),
                const Text("AMBULANCE 00",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ConstantsColor.primaryColor
                ),
                ),
                const SizedBox(height: 16,),
                const Text("ABOUT",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ConstantsColor.greyColor
                  ),
                ),

                const SizedBox(height: 16,),
                const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ConstantsColor.greyColor
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
                      'CALL NOW',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
