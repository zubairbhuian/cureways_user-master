import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/material.dart';

class ImgUploadBtn extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onTap;
  const ImgUploadBtn({super.key, required this.text, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 53,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color:color?? kDisabledTextColor)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
           Icon(Icons.photo_camera_outlined,color: color??kTextColor,),
          8.width,
          Text(
            text,
            style: kLabelLarge.copyWith(color:color?? kTextColor),
          ),
        ]),
      ),
    );
  }
}
