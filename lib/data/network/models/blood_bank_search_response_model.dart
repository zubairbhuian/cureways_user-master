class BloodBankSearchResponseModel {
  BloodBankSearchResponseModel({
    this.data,
  });

  BloodBankSearchResponseModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.status,
    this.bloodBankSearch,
  });

  Data.fromJson(dynamic json) {
    status = json['status'];
    if (json['bloodBankSearch'] != null) {
      bloodBankSearch = [];
      json['bloodBankSearch'].forEach((v) {
        bloodBankSearch?.add(BloodBankSearch.fromJson(v));
      });
    }
  }
  int? status;
  List<BloodBankSearch>? bloodBankSearch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (bloodBankSearch != null) {
      map['bloodBankSearch'] = bloodBankSearch?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BloodBankSearch {
  BloodBankSearch({
    this.id,
    this.divisionId,
    this.policeStationId,
    this.areaId,
    this.division,
    this.policestations,
    this.area,
    this.name,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  BloodBankSearch.fromJson(dynamic json) {
    id = json['id'];
    divisionId = json['division_id'];
    policeStationId = json['police_station_id'];
    areaId = json['area_id'];
    division = json['division'];
    policestations = json['policestations'];
    area = json['area'];
    name = json['name'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? divisionId;
  String? policeStationId;
  String? areaId;
  String? division;
  String? policestations;
  String? area;
  String? name;
  String? phone;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['division_id'] = divisionId;
    map['police_station_id'] = policeStationId;
    map['area_id'] = areaId;
    map['division'] = division;
    map['policestations'] = policestations;
    map['area'] = area;
    map['name'] = name;
    map['phone'] = phone;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
