// To parse this JSON data, do
//
//     final getDoctorModel = getDoctorModelFromJson(jsonString);

import 'dart:convert';

GetDoctorModel getDoctorModelFromJson(String str) =>
    GetDoctorModel.fromJson(json.decode(str));

String getDoctorModelToJson(GetDoctorModel data) =>
    json.encode(data.toJson());

class GetDoctorModel {
  final int status;
  final String message;
  final List<GetDoctorData> data;

  GetDoctorModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetDoctorModel.fromJson(Map<String, dynamic> json) => GetDoctorModel(
        status: json["status"] ?? 0,
        message: json["message"]?.toString() ?? '',
        data: (json["data"] as List?)
                ?.map((x) => GetDoctorData.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class GetDoctorData {
  final String id;
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;
  final bool isEmailVerified;
  final String role;
  final int age;
  final dynamic profileImage;
  final String country;
  final String timeZone;
  final String gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> specializations;
  final String? licence;
  final String? identification;
  final dynamic yearsOfExperience;
  final int numberOfPatients;
  final int numberOfSessions;
  final String? averageRating;
  final int totalReviews;

  GetDoctorData({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.isEmailVerified,
    required this.role,
    required this.age,
    required this.profileImage,
    required this.country,
    required this.timeZone,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.specializations,
    this.licence,
    this.identification,
    this.yearsOfExperience,
    required this.numberOfPatients,
    required this.numberOfSessions,
    this.averageRating,
    required this.totalReviews,
  });

  factory GetDoctorData.fromJson(Map<String, dynamic> json) => GetDoctorData(
        id: json["id"]?.toString() ?? '',
        email: json["email"]?.toString() ?? '',
        password: json["password"]?.toString() ?? '',
        fullName: json["fullName"]?.toString() ?? '',
        phoneNumber: json["phoneNumber"]?.toString() ?? '',
        isEmailVerified: json["isEmailVerified"] ?? false,
        role: json["role"]?.toString() ?? '',
        age: json["age"] ?? 0,
        profileImage: json["profileImage"],
        country: json["country"]?.toString() ?? '',
        timeZone: json["timeZone"]?.toString() ?? '',
        gender: json["gender"]?.toString() ?? '',
        createdAt:
            DateTime.tryParse(json["createdAt"]?.toString() ?? '') ??
                DateTime.now(),
        updatedAt:
            DateTime.tryParse(json["updatedAt"]?.toString() ?? '') ??
                DateTime.now(),
        specializations: (json["specializations"] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        licence: json["licence"]?.toString(),
        identification: json["identification"]?.toString(),
        yearsOfExperience: json["yearsOfExperience"],
        numberOfPatients: json["numberOfPatients"] ?? 0,
        numberOfSessions: json["numberOfSessions"] ?? 0,
        averageRating: json["averageRating"]?.toString(),
        totalReviews: json["totalReviews"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "isEmailVerified": isEmailVerified,
        "role": role,
        "age": age,
        "profileImage": profileImage,
        "country": country,
        "timeZone": timeZone,
        "gender": gender,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "specializations": specializations,
        "licence": licence,
        "identification": identification,
        "yearsOfExperience": yearsOfExperience,
        "numberOfPatients": numberOfPatients,
        "numberOfSessions": numberOfSessions,
        "averageRating": averageRating,
        "totalReviews": totalReviews,
      };
}
