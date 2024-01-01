class DoctorListModel {
  DoctorListModel({
    this.doctorDataList,
    this.message,
    this.status,
  });

  DoctorListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      doctorDataList = [];
      json['data'].forEach((v) {
        doctorDataList?.add(DoctorData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<DoctorData>? doctorDataList;
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (doctorDataList != null) {
      map['data'] = doctorDataList?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}

class DoctorData {
  DoctorData({
    this.id,
    this.name,
    this.phone,
    this.hospital,
    this.specialist,
    this.gender,
    this.type,
    this.typeNumeric,
    this.image,
  });

  DoctorData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    hospital = json['hospital'];
    specialist = json['specialist'];
    gender = json['gender'];
    type = json['type'];
    typeNumeric = json['type_numeric'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? phone;
  String? hospital;
  String? specialist;
  String? gender;
  String? type;
  String? typeNumeric;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['hospital'] = hospital;
    map['specialist'] = specialist;
    map['gender'] = gender;
    map['type'] = type;
    map['type_numeric'] = typeNumeric;
    map['image'] = image;
    return map;
  }
}
