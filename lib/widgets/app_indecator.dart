import 'package:cureways_user/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppIndecator extends StatelessWidget {
  final double? value;
  final Color? color;
  const AppIndecator({super.key, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? ConstantsColor.primaryColor,
      value: value,
    );
  }
}

class LoadIndecator extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadIndecator({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      size:size?? 20,
      color: color ?? kWhite,
    );
  }
}
