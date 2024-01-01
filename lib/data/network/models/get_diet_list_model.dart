class GetDietListModel {
  GetDietListModel({
    this.data,
    this.message,
    this.status,
  });

  GetDietListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DietListData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<DietListData>? data;
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

class DietListData {
  DietListData({
    this.id,
    this.userId,
    this.date,
    this.time,
    this.foodQty,
  });

  DietListData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    time = json['time'];
    foodQty = json['food_qty'];
  }
  int? id;
  String? userId;
  String? date;
  String? time;
  String? foodQty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['date'] = date;
    map['time'] = time;
    map['food_qty'] = foodQty;
    return map;
  }
}
