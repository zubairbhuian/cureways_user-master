class GetTmpModel {
  GetTmpModel({
    this.data,
    this.message,
    this.status,
  });

  GetTmpModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TmpListData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<TmpListData>? data;
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

class TmpListData {
  TmpListData({
    this.id,
    this.userId,
    this.date,
    this.bodyTemperature,
  });

  TmpListData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    bodyTemperature = json['body_temperature'];
  }
  int? id;
  String? userId;
  String? date;
  String? bodyTemperature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['date'] = date;
    map['body_temperature'] = bodyTemperature;
    return map;
  }
}
