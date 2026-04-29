// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
    final int status;
    final String message;
    final List<CountryData> data;

    CountryModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        status: json["status"],
        message: json["message"],
        data: List<CountryData>.from(json["data"].map((x) => CountryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CountryData {
    final String name;
    final String officialName;
    final List<String> timezones;

    CountryData({
        required this.name,
        required this.officialName,
        required this.timezones,
    });

    factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        name: json["name"],
        officialName: json["officialName"],
        timezones: List<String>.from(json["timezones"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "officialName": officialName,
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
    };
}
