import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utilis/const_color.dart';
import '../../../widgets/appbar.dart';
class HospitalDetailsScreen extends StatefulWidget {
  String hospitalName,hospitalAddress,hopitalDetails,imagePath,userName,number,email;

 HospitalDetailsScreen({Key? key,
    required this.hospitalName,
    required this.imagePath,
    required this.hopitalDetails,
    required this.hospitalAddress,
    required this.userName,
 required this.email,required this.number}) : super(key: key);

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  String? userName;
  @override
  void initState() {
    userName=widget.userName??"";
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppDefaultBar(title: "HOSPITAL INFORMATION", userNAme:userName!),
          const SizedBox(height: 8,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12),
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
                                CircularProgressIndicator()),
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
                        Text(widget.hospitalName,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ConstantsColor.primaryColor
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Text(widget.hopitalDetails,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ConstantsColor.primaryColor
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Text(widget.hospitalAddress,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ConstantsColor.greyColor
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Text(widget.number,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ConstantsColor.greyColor
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Text(widget.email,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ConstantsColor.greyColor
                          ),
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
