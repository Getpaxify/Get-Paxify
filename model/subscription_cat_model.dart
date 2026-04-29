// To parse this JSON data, do
//
//     final subscriptionCatModel = subscriptionCatModelFromJson(jsonString);

import 'dart:convert';

/// Root response model
class SubscriptionResponse {
  final int status;
  final String message;
  final List<SubscriptionCatModel> data;

  SubscriptionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) => SubscriptionResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? List<SubscriptionCatModel>.from(
                json["data"].map((x) => SubscriptionCatModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

/// Category model
class SubscriptionCatModel {
  final String id;
  final String name;
  final List<SubPlan> subPlans;

  SubscriptionCatModel({
    required this.id,
    required this.name,
    required this.subPlans,
  });

  factory SubscriptionCatModel.fromJson(Map<String, dynamic> json) => SubscriptionCatModel(
        id: json["id"],
        name: json["name"],
        subPlans: json["subPlans"] != null
            ? List<SubPlan>.from(json["subPlans"].map((x) => SubPlan.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subPlans": List<dynamic>.from(subPlans.map((x) => x.toJson())),
      };
}

/// SubPlan model
class SubPlan {
  final String id;
  final String name;
  final List<Option> options;

  SubPlan({
    required this.id,
    required this.name,
    required this.options,
  });

  factory SubPlan.fromJson(Map<String, dynamic> json) => SubPlan(
        id: json["id"],
        name: json["name"],
        options: json["options"] != null
            ? List<Option>.from(json["options"].map((x) => Option.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

/// Option model
class Option {
  final String id;
  final BillingCycle billingCycle;
  final int price;

  Option({
    required this.id,
    required this.billingCycle,
    required this.price,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        billingCycle: BillingCycle.fromJson(json["billingCycle"]),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "billingCycle": billingCycle.toJson(),
        "price": price,
      };
}

/// BillingCycle model
class BillingCycle {
  final String id;
  final String name;
  final int durationInDays;

  BillingCycle({
    required this.id,
    required this.name,
    required this.durationInDays,
  });

  factory BillingCycle.fromJson(Map<String, dynamic> json) => BillingCycle(
        id: json["id"],
        name: json["name"],
        durationInDays: json["durationInDays"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "durationInDays": durationInDays,
      };
}

/// Helper functions to convert from JSON string
SubscriptionResponse subscriptionResponseFromJson(String str) =>
    SubscriptionResponse.fromJson(json.decode(str));

String subscriptionResponseToJson(SubscriptionResponse data) =>
    json.encode(data.toJson());
