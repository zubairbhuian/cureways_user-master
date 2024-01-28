class DoctorModel {
  int id;
  String userId;
  String hospitalId;
  String specialistId;
  String description;
  String gender;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  Hospital hospital;

  DoctorModel({
    required this.id,
    required this.userId,
    required this.hospitalId,
    required this.specialistId,
    required this.description,
    required this.gender,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.hospital,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      userId: json['user_id']??"",
      hospitalId: json['hospital_id']??"",
      specialistId: json['specialist_id']??"",
      description: json['description']??"",
      gender: json['gender']??"",
      type: json['type']??"",
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: User.fromJson(json['user']),
      hospital: Hospital.fromJson(json['hospital']),
    );
  }
}

class User {
  int id;
  String roleId;
  String serviceType;
  String divisionId;
  String policeStationId;
  String areaId;
  String name;
  String email;
  String provider;
  String providerId;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.roleId,
    required this.serviceType,
    required this.divisionId,
    required this.policeStationId,
    required this.areaId,
    required this.name,
    required this.email,
    required this.provider,
    required this.providerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      roleId: json['role_id']??"",
      serviceType: json['service_type']??"",
      divisionId: json['division_id']??"",
      policeStationId: json['police_station_id']??"",
      areaId: json['area_id']??"",
      name: json['name']??"",
      email: json['email']??"",
      provider: json['provider']??"",
      providerId: json['provider_id']??"",
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Hospital {
  int id;
  String name;
  String image;
  String about;
  String phone;
  String address;
  String location;
  String divisionId;
  DateTime createdAt;
  DateTime updatedAt;
  String email;

  Hospital({
    required this.id,
    required this.name,
    required this.image,
    required this.about,
    required this.phone,
    required this.address,
    required this.location,
    required this.divisionId,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'],
      name: json['name'] ?? "",
      image: json['image'] ?? "",
      about: json['about'] ?? "",
      phone: json['phone'] ?? "",
      address: json['address'] ?? "",
      location: json['location'] ?? "",
      divisionId: json['division_id'] ?? "",
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      email: json['email'] ?? "",
    );
  }
}
