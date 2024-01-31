class ReportsModel {
  ReportsModel({
    this.id,
    this.userId,
    this.date,
    this.time,
    this.testType,
    this.result,
  });

  ReportsModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    time = json['time'];
    testType = json['test_type'];
    result = json['result'];
  }
  int? id;
  String? userId;
  String? date;
  String? time;
  String? result;
  String? testType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['date'] = date;
    map['time'] = time;
    map['test_type'] = testType;
    map['result'] = result;
    return map;
  }
}
