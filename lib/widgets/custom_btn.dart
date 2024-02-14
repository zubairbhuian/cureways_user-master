import 'package:cureways_user/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryBtn extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final Widget child;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? borderWidth;
  final double? elevation;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  const PrimaryBtn({
    Key? key,
    this.color,
    this.textColor,
    this.onPressed,
    this.borderRadius,
    this.style,
    this.height,
    this.width,
    this.borderWidth,
    this.elevation,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(1, 4),
          blurRadius: 8,
          spreadRadius: 0,
          color:kDangerColor.withOpacity(0.2),
        )
      ]),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          textStyle: style ?? TextStyle(color: textColor ?? kWhite,fontSize: 16),
          disabledBackgroundColor: kDisabledColor,
          disabledForegroundColor: kWhite,
          backgroundColor: color ?? kPrimaryColor,
          foregroundColor: textColor ?? kWhite,
          surfaceTintColor:Colors.transparent,
          shadowColor: kBlack,

          padding:
              padding ?? EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          ),
          side: BorderSide(
            color: kPrimaryColor,
            width: borderWidth ?? 0,
          ),
        ),
        child: child,
      ),
    );
  }
}

class OutLineBtn extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget child;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  const OutLineBtn(
      {super.key,
      this.backgroundColor,
      this.foregroundColor,
      this.onPressed,
      this.borderRadius,
      this.padding,
      this.height,
      this.width,
      this.textStyle,
      required this.child,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: padding ??
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            foregroundColor: foregroundColor ?? kPrimaryColor,
            side: BorderSide(width: 1, color: borderColor ?? kPrimaryColor),
            backgroundColor: backgroundColor ?? Colors.transparent,
            disabledForegroundColor: kWhite,
            disabledBackgroundColor: kDisabledColor,
            textStyle: textStyle ??
                TextStyle(
                    color: kRed,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius ?? 8.r), // Change the border radius value
            ),
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}

class GradientBtn extends StatelessWidget {
  const GradientBtn({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130.sw,
        padding: EdgeInsets.symmetric(
          vertical: 13.h,
        ),
        decoration: BoxDecoration(
          gradient: onTap == null
              ? const LinearGradient(
                  colors: [
                    Color(0xffC2C2C2),
                    Color(0xffC2C2C2)
                  ], // Define your gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [
                    Color(0xff9F9F9F),
                    Color(0xff9F9F9F)
                  ], // Define your gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius:
              BorderRadius.circular(50), // Optional: Add border radius
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class CustomDropdownButton extends StatelessWidget {
  final List data;
  final Function(String?)? onChanged;
  const CustomDropdownButton({super.key, required this.data, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconSize: 0,
      elevation: 16,
      isDense: true,
      dropdownColor: kWhite,
      underline: const Icon(
        Icons.more_vert,
        color: kTextColorLight,
      ),
      onChanged: onChanged,
      items: List.generate(
          data.length,
          (index) => DropdownMenuItem<String>(
                value: data[index],
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        // color: kRed,
                        child: Text(
                          data[index],
                        ),
                      ),
                    ),
                    const Divider(
                      color: kBlack,
                    )
                  ],
                ),
              )),
    );
  }
}
