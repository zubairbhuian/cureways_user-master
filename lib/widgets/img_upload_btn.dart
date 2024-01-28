import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/material.dart';

class ImgUploadBtn extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const ImgUploadBtn({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 53,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kDisabledTextColor)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.photo_camera_outlined),
          8.width,
          Text(
            text,
            style: kLabelLarge,
          ),
        ]),
      ),
    );
  }
}
