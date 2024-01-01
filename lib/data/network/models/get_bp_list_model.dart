class GetBpListModel {
  GetBpListModel({
    this.data,
    this.message,
    this.status,
  });

  GetBpListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetBpListData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<GetBpListData>? data;
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

class GetBpListData {
  GetBpListData({
    this.id,
    this.userId,
    this.date,
    this.sysotolic,
    this.diastolic,
  });

  GetBpListData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    sysotolic = json['sysotolic'];
    diastolic = json['diastolic'];
  }
  int? id;
  String? userId;
  String? date;
  String? sysotolic;
  String? diastolic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['date'] = date;
    map['sysotolic'] = sysotolic;
    map['diastolic'] = diastolic;
    return map;
  }
}
