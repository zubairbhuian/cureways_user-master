
import 'package:flutter/material.dart';

class HealthDataModel {
  double y1Value;
  double y2Value;
  Color y1color;
  Color y2color;

  HealthDataModel({
    required this.y1Value,
    required this.y2Value,
    required this.y1color,
    required this.y2color,
  });

  factory HealthDataModel.fromJson(Map<String, dynamic> json) {
    return HealthDataModel(
      y1Value: json['y1Value']==null?0:double.parse(json['y1Value'].toString()),
      y2Value:json['y2Value']==null?0:double.parse(json['y2Value'].toString()),
      y1color:Color(int.parse( json['y1color']==null? "0xff000000":"0xff${json['y1color']}")) ,
      y2color:Color(int.parse( json['y2color']==null? "0xff000000":"0xff${json['y2color']}")) ,
    );
  }
}
