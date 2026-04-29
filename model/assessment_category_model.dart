// To parse this JSON data, do
//
//     final assessmentCategoryModel = assessmentCategoryModelFromJson(jsonString);

import 'dart:convert';

AssessmentCategoryModel assessmentCategoryModelFromJson(String str) => AssessmentCategoryModel.fromJson(json.decode(str));

String assessmentCategoryModelToJson(AssessmentCategoryModel data) => json.encode(data.toJson());

class AssessmentCategoryModel {
    final int status;
    final String message;
    final List<AssessmentCategory> data;

    AssessmentCategoryModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory AssessmentCategoryModel.fromJson(Map<String, dynamic> json) => AssessmentCategoryModel(
        status: json["status"],
        message: json["message"],
        data: List<AssessmentCategory>.from(json["data"].map((x) => AssessmentCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class AssessmentCategory {
    final String id;
    final String name;

    AssessmentCategory({
        required this.id,
        required this.name,
    });

    factory AssessmentCategory.fromJson(Map<String, dynamic> json) => AssessmentCategory(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
