// To parse this JSON data, do
//
//     final upcominAppointmentModel = upcominAppointmentModelFromJson(jsonString);

import 'dart:convert';

UpcominAppointmentModel upcominAppointmentModelFromJson(String str) => UpcominAppointmentModel.fromJson(json.decode(str));

String upcominAppointmentModelToJson(UpcominAppointmentModel data) => json.encode(data.toJson());

class UpcominAppointmentModel {
    final int status;
    final String message;
    final List<UpcomingAppointmentData> data;

    UpcominAppointmentModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory UpcominAppointmentModel.fromJson(Map<String, dynamic> json) => UpcominAppointmentModel(
        status: json["status"],
        message: json["message"],
        data: List<UpcomingAppointmentData>.from(json["data"].map((x) => UpcomingAppointmentData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class UpcomingAppointmentData {
    final String bookingId;
    final DateTime scheduledAt;
    final int durationMinutes;
    final String status;
    final Doctor doctor;

    UpcomingAppointmentData({
        required this.bookingId,
        required this.scheduledAt,
        required this.durationMinutes,
        required this.status,
        required this.doctor,
    });

    factory UpcomingAppointmentData.fromJson(Map<String, dynamic> json) => UpcomingAppointmentData(
        bookingId: json["bookingId"],
        scheduledAt: DateTime.parse(json["scheduledAt"]),
        durationMinutes: json["durationMinutes"],
        status: json["status"],
        doctor: Doctor.fromJson(json["doctor"]),
    );

    Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "scheduledAt": scheduledAt.toIso8601String(),
        "durationMinutes": durationMinutes,
        "status": status,
        "doctor": doctor.toJson(),
    };
}

class Doctor {
    final String id;
    final String fullName;
    final dynamic profileImage;
    final String phoneNumber;
    final List<String> specializations;
    final String averageRating;

    Doctor({
        required this.id,
        required this.fullName,
        required this.profileImage,
        required this.phoneNumber,
        required this.specializations,
        required this.averageRating,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        fullName: json["fullName"],
        profileImage: json["profileImage"],
        phoneNumber: json["phoneNumber"],
        specializations: List<String>.from(json["specializations"].map((x) => x)),
        averageRating: json["averageRating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "profileImage": profileImage,
        "phoneNumber": phoneNumber,
        "specializations": List<dynamic>.from(specializations.map((x) => x)),
        "averageRating": averageRating,
    };
}
