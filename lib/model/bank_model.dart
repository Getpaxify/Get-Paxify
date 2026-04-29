class BankListResponse {
  final int? status;
  final String? message;
  final List<BankData>? data;

  BankListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory BankListResponse.fromJson(Map<String, dynamic> json) {
    return BankListResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BankData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class BankData {
   String? name;
  final String? code;
  final String? slug;
  final bool? active;

  BankData({
    this.name,
    this.code,
    this.slug,
    this.active,
  });

  factory BankData.fromJson(Map<String, dynamic> json) {
    return BankData(
      name: json['name'] as String?,
      code: json['code']?.toString(), // some codes are numeric & alphanumeric
      slug: json['slug'] as String?,
      active: json['active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'slug': slug,
      'active': active,
    };
  }
}
