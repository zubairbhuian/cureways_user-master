import 'package:cached_network_image/cached_network_image.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/const_color.dart';
class MedicineDetailsScreen extends StatefulWidget {
  String vaccineName,vaccineType,vaccineDetails,imagePath,price;
   MedicineDetailsScreen({Key? key,
   required this.vaccineName,required this.imagePath,required this.vaccineDetails,required this.vaccineType,
     required this.price

   }) : super(key: key);

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen> {
  String? vaccineName,vaccineType,vaccineDetails,imagePath,price;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Medicine Details")),
    //  appBar:  AppBar(
    //    toolbarHeight: 152,
    //    automaticallyImplyLeading: false,
    //    backgroundColor: Colors.white,
    //    shape: const RoundedRectangleBorder(
    //      borderRadius: BorderRadius.only(
    //          bottomLeft: Radius.circular(12.0),
    //          bottomRight: Radius.circular(12.0)),
    //    ),
    //    title: Padding(
    //      padding: const EdgeInsets.all(8.0),
    //      child: Column(
    //        crossAxisAlignment: CrossAxisAlignment.start,
    //        children: [
    //          //SizedBox(height: 42,),
    //          Row(
    //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //            children: [
    //              const Expanded(
    //                child: Column(
    //                  crossAxisAlignment: CrossAxisAlignment.start,
    //                  mainAxisAlignment: MainAxisAlignment.start,
    //                  children: [
    //                    Text(
    //                      "Hi, Muhammad!",
    //                      textAlign: TextAlign.start,
    //                      style: TextStyle(
    //                          fontSize: 22,
    //                          fontWeight: FontWeight.w700,
    //                          color: Color(0xff0F4B97)),
    //                    ),
    //                    Text(
    //                      "Welcome back",
    //                      textAlign: TextAlign.start,
    //                      style: TextStyle(
    //                          fontSize: 18,
    //                          fontWeight: FontWeight.w400,
    //                          color: Color(0xff0F4B97)),
    //                    )
    //                  ],
    //                ),
    //              ),
    //              SvgPicture.asset(
    //                "assets/home_screen/bell.svg",
    //                height: 32,
    //                width: 32,
    //                color: const Color(0xff0F4B97),
    //              )
    //            ],
    //          ),
    //          const SizedBox(
    //            height: 16,
    //          ),
    //          SizedBox(
    //            width: 124,
    //            height: 48,
    //            child: OutlinedButton(
    //              onPressed: () {},
    //              style: OutlinedButton.styleFrom(
    //                backgroundColor: ConstantsColor.backgroundColor,
    //                shape: RoundedRectangleBorder(
    //                  borderRadius: BorderRadius.circular(5),
    //                ),
    //              ),
    //              child: const Row(
    //                mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                children: [
    //                  Icon(
    //                    Icons.arrow_back,
    //                    size: 24,
    //                    color: ConstantsColor.primaryColor,
    //                  ),
    //                  Text(
    //                    'Go Back',
    //                    style: TextStyle(
    //                        color: ConstantsColor.primaryColor, fontSize: 16),
    //                  ),
    //                ],
    //              ),
    //            ),
    //          ),
    //        ],
    //      ),
    //    ),
    //  ),
      body:Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 228,
                          width: double.maxFinite,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                          child: CachedNetworkImage(
                            imageUrl: widget.imagePath,
                            placeholder: (context, url) =>
                            const Center(
                                child:
                                AppIndecator()),
                            errorWidget:
                                (context, url, error) =>
                            const Icon(
                              Icons.error,
                              color: ConstantsColor.primaryColor,
                            ),
                            fit:BoxFit.fill ,
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Row(
                          children: [
                            const Text("Namee:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: ConstantsColor.primaryColor
                              ),
                            ),
                            Text(widget.vaccineName,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: ConstantsColor.primaryColor
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Row(
                          children: [
                            const Text("Medicine Type:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: ConstantsColor.primaryColor
                              ),
                            ),
                            Text(widget.vaccineType,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ConstantsColor.primaryColor
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16,),
               Row(
                 children: [
                   const Text("Details:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: ConstantsColor.primaryColor
                              ),
                            ),
                   Text(widget.vaccineDetails,
                     style: const TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.w700,
                         color: ConstantsColor.primaryColor
                     ),
                   ),
                 ],
               ),

                        const SizedBox(height: 16,),
                        Row(
                          children: [
                            const Text("Price:",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: ConstantsColor.primaryColor
                              ),
                            ),
                            Text(widget.price,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ConstantsColor.primaryColor
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32,),


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
