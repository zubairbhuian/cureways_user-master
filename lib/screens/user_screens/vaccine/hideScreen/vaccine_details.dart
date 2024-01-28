import 'package:cached_network_image/cached_network_image.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/const_color.dart';
import '../../../../widgets/appbar.dart';

class VaccineDetailsScreen extends StatefulWidget {
  String vaccineName, vaccineType, vaccineDetails, imagePath, userName;
  VaccineDetailsScreen(
      {Key? key,
      required this.vaccineName,
      required this.imagePath,
      required this.vaccineDetails,
      required this.vaccineType,
      required this.userName})
      : super(key: key);

  @override
  State<VaccineDetailsScreen> createState() => _VaccineDetailsScreenState();
}

class _VaccineDetailsScreenState extends State<VaccineDetailsScreen> {
  String? userName;
  @override
  void initState() {
    userName = widget.userName ;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppDefaultBar(title: "VACCINE DETAILS", userNAme: userName!),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 228,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: CachedNetworkImage(
                              imageUrl: widget.imagePath,
                              placeholder: (context, url) => const Center(
                                  child: AppIndecator()),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: ConstantsColor.primaryColor,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.vaccineName,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ConstantsColor.primaryColor),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.vaccineType,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ConstantsColor.primaryColor),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Descriptions",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ConstantsColor.greyColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.vaccineDetails,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ConstantsColor.greyColor),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        /*SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>const VaccineOrderScreen()));

                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: ConstantsColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'ORDER NOW',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),*/
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
