import 'package:cached_network_image/cached_network_image.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/const_color.dart';

class HealthTipsDetailsScreen extends StatefulWidget {
  String name, type, details, path;
  HealthTipsDetailsScreen({
    Key? key,
    required this.name,
    required this.path,
    required this.details,
    required this.type,
  }) : super(key: key);

  @override
  State<HealthTipsDetailsScreen> createState() =>
      _HealthTipsDetailsScreenState();
}

class _HealthTipsDetailsScreenState extends State<HealthTipsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Health Tips Details")),
      // appBar: AppBar(
      //   toolbarHeight: 152,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(12.0),
      //         bottomRight: Radius.circular(12.0)),
      //   ),
      //   title: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         //SizedBox(height: 42,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             const Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "Welcome back",
      //                   textAlign: TextAlign.start,
      //                   style: TextStyle(
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.w400,
      //                       color: Color(0xff0F4B97)),
      //                 )
      //               ],
      //             ),
      //             SvgPicture.asset(
      //               "assets/home_screen/bell.svg",
      //               height: 32,
      //               width: 32,
      //               color: const Color(0xff0F4B97),
      //             )
      //           ],
      //         ),
      //         const SizedBox(
      //           height: 16,
      //         ),
      //         SizedBox(
      //           width: 140,
      //           height: 48,
      //           child: OutlinedButton(
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //             style: OutlinedButton.styleFrom(
      //               backgroundColor: ConstantsColor.backgroundColor,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(5),
      //               ),
      //             ),
      //             child: const Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Icon(
      //                   Icons.arrow_back,
      //                   size: 24,
      //                   color: ConstantsColor.primaryColor,
      //                 ),
      //                 Text(
      //                   'Go Back',
      //                   style: TextStyle(
      //                       color: ConstantsColor.primaryColor, fontSize: 16),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 228,
                      width: double.maxFinite,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: CachedNetworkImage(
                        imageUrl: widget.path,
                        placeholder: (context, url) =>
                            const Center(child: AppIndecator()),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Title: ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: ConstantsColor.primaryColor),
                      ),
                      Expanded(
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ConstantsColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Details: ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: ConstantsColor.primaryColor),
                      ),
                      Expanded(
                        child: Text(
                          widget.details,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ConstantsColor.greyColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Created At: ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: ConstantsColor.primaryColor),
                      ),
                      Text(
                        widget.type,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ConstantsColor.primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
