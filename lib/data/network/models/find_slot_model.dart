class FindSlotModel {
  FindSlotModel({
    this.slotData,
    this.message,
    this.status,
  });

  FindSlotModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      slotData = [];
      json['data'].forEach((v) {
        slotData?.add(FindSlotData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<FindSlotData>? slotData;
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (slotData != null) {
      map['data'] = slotData?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}

class FindSlotData {
  FindSlotData({
    this.id,
    this.date,
    this.slotFrom,
    this.slotTo,
    this.status,
  });

  FindSlotData.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
    slotFrom = json['slot_from'];
    slotTo = json['slot_to'];
    status = json['status'];
  }
  int? id;
  String? date;
  String? slotFrom;
  String? slotTo;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['slot_from'] = slotFrom;
    map['slot_to'] = slotTo;
    map['status'] = status;
    return map;
  }
}
