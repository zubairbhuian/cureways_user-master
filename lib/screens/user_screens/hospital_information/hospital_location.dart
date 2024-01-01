import 'package:flutter/material.dart';
class HospitalLocation extends StatefulWidget {
  const HospitalLocation({Key? key}) : super(key: key);

  @override
  State<HospitalLocation> createState() => _HospitalLocationState();
}

class _HospitalLocationState extends State<HospitalLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: const Image(image: AssetImage(
          "assets/home_screen/Map.png"
      ),
       height: 20,
        width: 20,
        fit: BoxFit.fill,
      ),
    );
  }
}
