// import 'dart:convert';

// ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

// String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

// class ProfileModel {
//   final int status;
//   final String message;
//   final ProfileInfo data;

//   ProfileModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
//         status: _parseInt(json['status'], defaultValue: 0),
//         message: _parseString(json['message'], defaultValue: ''),
//         data: ProfileInfo.fromJson(json['data'] ?? <String, dynamic>{}),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//       };
// }

// class ProfileInfo {
//   final String id;
//   final String email;
//   final List<Assessment> assessments;
//   final String fullName;
//   final String phoneNumber;
//   final String role;
//   final int age;
//   final String profileImage;
//   final String country;
//   final String timeZone;
//   final String gender;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   ProfileInfo({
//     required this.id,
//     required this.email,
//     required this.assessments,
//     required this.fullName,
//     required this.phoneNumber,
//     required this.role,
//     required this.age,
//     required this.profileImage,
//     required this.country,
//     required this.timeZone,
//     required this.gender,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ProfileInfo.fromJson(Map<String, dynamic> json) {
//     final assessmentsJson = json['assessments'];
//     List<Assessment> parsedAssessments = [];
//     if (assessmentsJson is List) {
//       parsedAssessments = assessmentsJson
//           .where((e) => e != null)
//           .map((e) => Assessment.fromJson((e as Map<String, dynamic>)))
//           .toList();
//     }

//     return ProfileInfo(
//       id: _parseString(json['id'], defaultValue: ''),
//       email: _parseString(json['email'], defaultValue: ''),
//       assessments: parsedAssessments,
//       fullName: _parseString(json['fullName'] ?? json['full_name'], defaultValue: ''),
//       phoneNumber: _parseString(json['phoneNumber'] ?? json['phone_number'], defaultValue: ''),
//       role: _parseString(json['role'], defaultValue: ''),
//       age: _parseInt(json['age'], defaultValue: 0),
//       profileImage: _parseString(json['profileImage'] ?? json['profile_image'], defaultValue: ''),
//       country: _parseString(json['country'], defaultValue: ''),
//       timeZone: _parseString(json['timeZone'] ?? json['timezone'], defaultValue: ''),
//       gender: _parseString(json['gender'], defaultValue: ''),
//       createdAt: _parseDateTime(json['createdAt'] ?? json['created_at']),
//       updatedAt: _parseDateTime(json['updatedAt'] ?? json['updated_at']),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "assessments": assessments.map((x) => x.toJson()).toList(),
//         "fullName": fullName,
//         "phoneNumber": phoneNumber,
//         "role": role,
//         "age": age,
//         "profileImage": profileImage,
//         "country": country,
//         "timeZone": timeZone,
//         "gender": gender,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//       };
// }

// class Assessment {
//   final String id;
//   final String intensity;
//   final List<String> categories;
//   final List<String> addictionDetails;
//   final String notes;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   Assessment({
//     required this.id,
//     required this.intensity,
//     required this.categories,
//     required this.addictionDetails,
//     required this.notes,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Assessment.fromJson(Map<String, dynamic> json) {
//     final categoriesRaw = json['categories'];
//     final addictionRaw = json['addictionDetails'] ?? json['addiction_details'];

//     List<String> parsedCategories = [];
//     if (categoriesRaw is List) {
//       parsedCategories = categoriesRaw.where((e) => e != null).map((e) => _parseString(e)).toList();
//     }

//     List<String> parsedAddiction = [];
//     if (addictionRaw is List) {
//       parsedAddiction = addictionRaw.where((e) => e != null).map((e) => _parseString(e)).toList();
//     }

//     return Assessment(
//       id: _parseString(json['id'], defaultValue: ''),
//       intensity: _parseString(json['intensity'], defaultValue: ''),
//       categories: parsedCategories,
//       addictionDetails: parsedAddiction,
//       notes: _parseString(json['notes'], defaultValue: ''),
//       createdAt: _parseDateTime(json['created_at'] ?? json['createdAt']),
//       updatedAt: _parseDateTime(json['updated_at'] ?? json['updatedAt']),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "intensity": intensity,
//         "categories": categories,
//         "addictionDetails": addictionDetails,
//         "notes": notes,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// /// ----------------- Helper parsing functions -----------------

// String _parseString(dynamic value, {String defaultValue = ''}) {
//   if (value == null) return defaultValue;
//   try {
//     return value.toString();
//   } catch (_) {
//     return defaultValue;
//   }
// }

// int _parseInt(dynamic value, {int defaultValue = 0}) {
//   if (value == null) return defaultValue;
//   if (value is int) return value;
//   if (value is double) return value.toInt();
//   final s = value.toString();
//   return int.tryParse(s) ?? defaultValue;
// }

// DateTime _parseDateTime(dynamic value) {
//   // If missing or null, return epoch (1970-01-01) so it's never null.
//   if (value == null) return DateTime.fromMillisecondsSinceEpoch(0);
//   if (value is DateTime) return value;
//   // Some APIs return number timestamps
//   if (value is int) {
//     // assume seconds if < 1e12, else milliseconds
//     if (value < 1000000000000) {
//       return DateTime.fromMillisecondsSinceEpoch(value * 1000);
//     } else {
//       return DateTime.fromMillisecondsSinceEpoch(value);
//     }
//   }
//   final s = value.toString();
//   final parsed = DateTime.tryParse(s);
//   if (parsed != null) return parsed;
//   // try parsing as integer string
//   final numVal = int.tryParse(s);
//   if (numVal != null) {
//     if (numVal < 1000000000000) {
//       return DateTime.fromMillisecondsSinceEpoch(numVal * 1000);
//     } else {
//       return DateTime.fromMillisecondsSinceEpoch(numVal);
//     }
//   }
//   // fallback: epoch
//   return DateTime.fromMillisecondsSinceEpoch(0);
// }
import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

class ProfileModel {
  final int status;
  final String message;
  final ProfileInfo data;

  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: _parseInt(json['status']),
        message: _parseString(json['message']) ?? '',
        data: ProfileInfo.fromJson(json['data'] ?? {}),
      );
}

class ProfileInfo {
  final String? id;
  final String? email;
  final List<Assessment>? assessments;
  final String? fullName;
  final String? phoneNumber;
  final bool? isEmailVerified;
  final String? role;
  final int? age;
  final String? profileImage;
  final String? country;
  final String? timeZone;
  final String? gender;
final int? totalReviews;
  final int? yearsOfExperience;
  final int? numberOfPatients;
  final int? numberOfbookings;
  final int? numberOfSessions;
  final DoctorProfile? doctorProfile;
  final Wallet? wallet;
  final DateTime? createdAt;
  final DateTime? updatedAt;
 final double? averageRating;
  ProfileInfo({
    this.id,
    this.email,
    this.numberOfbookings,
    this.assessments,
    this.fullName,
    this.phoneNumber,
    this.isEmailVerified,
    this.role,
    this.age,
    this.profileImage,
    this.country,
    this.timeZone,
    this.gender,
    this.doctorProfile,
    this.wallet,
     this.averageRating,
    this.totalReviews,
    this.yearsOfExperience,
    this.numberOfPatients,
    this.numberOfSessions,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
        id: _parseString(json['id']),
        email: _parseString(json['email']),
        assessments: (json['assessments'] as List?)
            ?.map((e) => Assessment.fromJson(e))
            .toList(),
        fullName: _parseString(json['fullName'] ?? json['full_name']),
        phoneNumber: _parseString(json['phoneNumber'] ?? json['phone_number']),
        isEmailVerified: json['isEmailVerified'],
        role: _parseString(json['role']),
        age: _parseIntNullable(json['age']),
        profileImage:
            _parseString(json['profileImage'] ?? json['profile_image']),
        country: _parseString(json['country']),
        timeZone: _parseString(json['timeZone'] ?? json['timezone']),
        gender: _parseString(json['gender']),
        averageRating: _parseDouble(json['averageRatings']),
        totalReviews: _parseIntNullable(json['totalReviews']),
        yearsOfExperience: _parseIntNullable(json['yearsOfExperience']),
        numberOfPatients: _parseIntNullable(json['numberOfPatients']),
        numberOfSessions: _parseIntNullable(json['numberOfSessions']),
        numberOfbookings: _parseIntNullable(json['numberOfBookings']),
        doctorProfile: json['doctorProfile'] == null
            ? null
            : DoctorProfile.fromJson(json['doctorProfile']),
        wallet: json['wallet'] == null ? null : Wallet.fromJson(json['wallet']),
        createdAt: _parseDateTimeNullable(json['createdAt']),
        updatedAt: _parseDateTimeNullable(json['updatedAt']),
      );
}

class DoctorProfile {
  final String? id;
  final List<String>? specializations;
  final String? licence;
  final String? identification;
  final Wallet? wallet;
  final double? averageRating;
    final String? bio;
  final int? totalReviews;
  final int? yearsOfExperience;
  final int? numberOfPatients;
  final int? numberOfSessions;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DoctorProfile({
    this.id,
    this.specializations,
    this.licence,
    this.identification,
    this.wallet,
    this.averageRating,
    this.totalReviews,
    this.yearsOfExperience,
    this.numberOfPatients,
    this.numberOfSessions,
        this.bio,
    this.createdAt,
    this.updatedAt,
  });

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => DoctorProfile(
        id: _parseString(json['id']),
        specializations: (json['specializations'] as List?)
            ?.map((e) => _parseString(e))
            .whereType<String>()
            .toList(),
        licence: _parseString(json['licence']),
        identification: _parseString(json['identification']),
        wallet: json['wallet'] == null ? null : Wallet.fromJson(json['wallet']),
        averageRating: _parseDouble(json['averageRating']),
        totalReviews: _parseIntNullable(json['totalReviews']),
        yearsOfExperience: _parseIntNullable(json['yearsOfExperience']),
        numberOfPatients: _parseIntNullable(json['numberOfPatients']),
        numberOfSessions: _parseIntNullable(json['numberOfSessions']),
        createdAt: _parseDateTimeNullable(json['createdAt']),
        updatedAt: _parseDateTimeNullable(json['updatedAt']),
                bio: _parseString(json['bio']),
      );
}

class Wallet {
  final String? id;
  final double? balance;
  final String? bankName;
  final String? bankCode;
  final String? accountNumber;
  final String? accountName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Wallet({
    this.id,
    this.balance,
    this.bankName,
    this.bankCode,
    this.accountNumber,
    this.accountName,
    this.createdAt,
    this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: _parseString(json['id']),
        balance: _parseDouble(json['balance']),
        bankName: _parseString(json['bankName']),
        bankCode: _parseString(json['bankCode']),
        accountNumber: _parseString(json['accountNumber']),
        accountName: _parseString(json['accountName']),
        createdAt: _parseDateTimeNullable(json['createdAt']),
        updatedAt: _parseDateTimeNullable(json['updatedAt']),
      );
}

class Assessment {
  final String? id;
  final String? intensity;
  final List<String>? categories;
  final List<String>? addictionDetails;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Assessment({
    this.id,
    this.intensity,
    this.categories,
    this.addictionDetails,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
        id: _parseString(json['id']),
        intensity: _parseString(json['intensity']),
        // categories: (json['categories'] as List?)
        //     ?.map((e) => _parseString(e))
        //     .whereType<String>()
        //     .toList(),
        categories:
            (json['categories'] as List?)?.map((e) => e.toString()).toList(),

        // addictionDetails:
        //     (json['addictionDetails'] ?? json['addiction_details'] as List?)
        //         ?.map((e) => _parseString(e))
        //         .toList(),
        addictionDetails:
            ((json['addictionDetails'] ?? json['addiction_details']) as List?)
                ?.map((e) => e.toString())
                .toList(),

        notes: _parseString(json['notes']),
        createdAt:
            _parseDateTimeNullable(json['createdAt'] ?? json['created_at']),
        updatedAt:
            _parseDateTimeNullable(json['updatedAt'] ?? json['updated_at']),
      );
}

String? _parseString(dynamic v) => v?.toString();

int _parseInt(dynamic v) => int.tryParse(v.toString()) ?? 0;

int? _parseIntNullable(dynamic v) =>
    v == null ? null : int.tryParse(v.toString());

double? _parseDouble(dynamic v) =>
    v == null ? null : double.tryParse(v.toString());

DateTime? _parseDateTimeNullable(dynamic v) {
  try {
    return v == null ? null : DateTime.parse(v.toString());
  } catch (_) {
    return null;
  }
}
