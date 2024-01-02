import 'package:cureways_user/utils/const_color.dart';
import 'package:cureways_user/widgets/app_indecator.dart';
import 'package:cureways_user/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class PopupDialog {
  // base dialog
  static dynamic base(
      {required Widget child,
      BuildContext? context,
      double? width,
      double? borderRadius,
      Color? barrierColor,
      Color? shadowColor,
      double? elevation,
      EdgeInsets? padding,
      required bool barrierDismissible}) {
    return showDialog<void>(
      // Context
      context: context ?? Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Column(
          // for horizontal minHeight
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // for ertical minWidth
            Center(
              child: SizedBox(
                // dialog width
                width: width ?? 380.w,
                child: Material(
                    elevation: elevation ?? 2,
                    // dialog color
                    shadowColor: shadowColor ?? Colors.black12,
                    // backgraund color
                    color: kWhite,
                    // border radius
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                    // main body
                    child: Padding(
                      // padding
                      padding: padding ?? EdgeInsets.zero,
                      child: child,
                    )),
              ),
            ),
          ],
        );
      },
    );
  }

  // AlertDialog
  static void showAlertDialog(String title, String message) {}
  // SuccessDialog
  static void showSuccessDialog(String message, {String title = "Success"}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
    );
  }

  // error messase
  static void showErrorMessage(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  }
  // Loading Dialog

  static void showLoadingDialog() => base(
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIndecator(),
          SizedBox(height: 20),
          Text("Loading"),
        ],
      ),
      padding: const EdgeInsets.all(16),
      width: 200,
      barrierDismissible: false);

  /// permission dioalg
  static void permission(
          {required String title,
          required String description,
          required VoidCallback ontap}) =>
      base(
        barrierDismissible: true,
        child: Column(
          children: [
            // header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: kTextColor))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.close))
                ],
              ),
            ),
            // body
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryBtn(
                          width: 120,
                          color: kPrimaryColor,
                          textColor: kWhite,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Text('Cancel'),
                          onPressed: () {
                            Get.back();
                          }),
                      const SizedBox(
                        width: 24,
                      ),
                      PrimaryBtn(
                          width: 120.w,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                           child: Text('Yes') ,
                          onPressed: ontap),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );

  // close dialog
  static void closeLoadingDialog() {
    Get.back();
  }
}
