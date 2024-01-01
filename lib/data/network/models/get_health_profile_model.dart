class GetHealthProfileModel {
  GetHealthProfileModel({
    this.data,
    this.message,
    this.status,
  });

  GetHealthProfileModel.fromJson(dynamic json) {
    data = json['data'] != null
        ? GetHealthProfileData.fromJson(json['data'])
        : null;
    message = json['message'];
    status = json['status'];
  }
  GetHealthProfileData? data;
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}

class GetHealthProfileData {
  GetHealthProfileData({
    this.id,
    this.userId,
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.marital,
    this.chiefComplain,
    this.prevDisease,
    this.otHistory,
    this.medication,
    this.disabilities,
    this.testResult,
  });

  GetHealthProfileData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    age = json['age'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    marital = json['marital'];
    chiefComplain = json['chief_complain'];
    prevDisease = json['prev_disease'];
    otHistory = json['ot_history'];
    medication = json['medication'];
    disabilities = json['disabilities'];
    testResult = json['test_result'];
  }
  int? id;
  String? userId;
  String? age;
  String? gender;
  String? height;
  String? weight;
  String? marital;
  String? chiefComplain;
  String? prevDisease;
  String? otHistory;
  String? medication;
  String? disabilities;
  String? testResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['age'] = age;
    map['gender'] = gender;
    map['height'] = height;
    map['weight'] = weight;
    map['marital'] = marital;
    map['chief_complain'] = chiefComplain;
    map['prev_disease'] = prevDisease;
    map['ot_history'] = otHistory;
    map['medication'] = medication;
    map['disabilities'] = disabilities;
    map['test_result'] = testResult;
    return map;
  }
}
