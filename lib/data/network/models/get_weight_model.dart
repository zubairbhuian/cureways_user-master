class GetWeightModel {
  GetWeightModel({
    this.data,
    this.message,
    this.status,
  });

  GetWeightModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WeightListData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<WeightListData>? data;
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

class WeightListData {
  WeightListData({
    this.id,
    this.userId,
    this.date,
    this.weight,
  });

  WeightListData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    weight = json['weight'];
  }
  int? id;
  String? userId;
  String? date;
  String? weight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['date'] = date;
    map['weight'] = weight;
    return map;
  }
}
