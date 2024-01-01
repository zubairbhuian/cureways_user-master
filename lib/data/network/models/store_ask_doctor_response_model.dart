class StoreAskDoctorResponseModel {
  StoreAskDoctorResponseModel({
    this.data,
    this.message,
    this.status,
  });

  StoreAskDoctorResponseModel.fromJson(dynamic json) {
    data =
        json['data'] != null ? StoreAskDoctorData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
  StoreAskDoctorData? data;
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

class StoreAskDoctorData {
  StoreAskDoctorData({
    this.id,
    this.userId,
    this.questionUserId,
    this.ansName,
    this.question,
    this.ans,
  });

  StoreAskDoctorData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    questionUserId = json['question_user_id'];
    ansName = json['ans_name'];
    question = json['question'];
    ans = json['ans'];
  }
  int? id;
  int? userId;
  String? questionUserId;
  dynamic ansName;
  String? question;
  dynamic ans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['question_user_id'] = questionUserId;
    map['ans_name'] = ansName;
    map['question'] = question;
    map['ans'] = ans;
    return map;
  }
}
