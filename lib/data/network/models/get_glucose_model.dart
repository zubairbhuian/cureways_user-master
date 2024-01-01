class GetGlucoseModel {
  GetGlucoseModel({
    this.data,
    this.message,
    this.status,
  });

  GetGlucoseModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GlucoseListData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<GlucoseListData>? data;
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}

class GlucoseListData {
  GlucoseListData({
    this.id,
    this.userId,
    this.date,
    this.timePeriod,
    this.timePeriodName,
    this.testResult,
  });

  GlucoseListData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    timePeriod = json['time_period'];
    timePeriodName = json['time_period_name'];
    testResult = json['test_result'];
  }
  int? id;
  String? userId;
  String? date;
  String? timePeriod;
  String? timePeriodName;
  String? testResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['date'] = date;
    map['time_period'] = timePeriod;
    map['time_period_name'] = timePeriodName;
    map['test_result'] = testResult;
    return map;
  }
}
