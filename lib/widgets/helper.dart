import 'package:intl/intl.dart';

class ValidatorHelper {
  // Required field
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    return null; 
  }

  static String? validateAmountAgainstBalance(String? value, double balance) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    final amount = double.tryParse(value) ?? 0.0;

    if (amount > balance) {
      return 'Amount exceeds wallet balance';
    }

    return null;
  }


  // Email validation
static String? email(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Email is required";
  }

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  );

  if (!emailRegex.hasMatch(value)) {
    return "Enter a valid email";
  }

  return null;
}


  // Password validation
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }


  // Custom min length
  static String? minLength(String? value, int min, {String fieldName = "Field"}) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    } else if (value.length < min) {
      return "$fieldName must be at least $min characters";
    }
    return null;
  }
}

String formatdynamicBalance(dynamic amount) {
  final value = double.tryParse(amount.toString().replaceAll(',', '')) ?? 0.0;

  final formatter = NumberFormat.currency(locale: 'en_NG', symbol: '');
  return formatter.format(value);
}

String maskEmail(String email) {
  final index = email.indexOf('@');
  if (index <= 1) return email; // nothing to mask

  String user = email.substring(0, index);
  String domain = email.substring(index);

  String first = user[0];
  String last = user[user.length - 1];
  String stars = "•" * (user.length - 2);

  return "$first$stars$last$domain";
}


class MaskHelper {
  static String phone(String phone) {
    if (phone.length <= 3) return phone;
    String stars = "•" * (phone.length - 3);
    return "$stars${phone.substring(phone.length - 3)}";
  }

  static String email(String email) {
    final index = email.indexOf('@');
    if (index <= 1) return email;
    String user = email.substring(0, index);
    String domain = email.substring(index);
    String first = user[0];
    String last = user[user.length - 1];
    String stars = "•" * (user.length - 2);
    return "$first$stars$last$domain";
  }
}
