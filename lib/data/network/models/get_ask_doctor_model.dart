class GetAskDoctorModel {
  GetAskDoctorModel({
    this.data,
    this.message,
    this.status,
  });

  GetAskDoctorModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetAskDoctorData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  List<GetAskDoctorData>? data;
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

class GetAskDoctorData {
  GetAskDoctorData({
    this.id,
    this.userId,
    this.questionUserId,
    this.ansName,
    this.question,
    this.ans,
  });

  GetAskDoctorData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    questionUserId = json['question_user_id'];
    ansName = json['ans_name'];
    question = json['question'];
    ans = json['ans'];
  }
  int? id;
  String? userId;
  String? questionUserId;
  String? ansName;
  String? question;
  String? ans;

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
