import 'package:real_time_track_package/src/enums/input_type.dart';

class Validator {
  Validator._();
  //
  static String? emailPhoneNumber(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter Email address or Phone Number';
    } else {
      if (checkInputType(value!) == InputType.email) {
        return emailAddress(value);
      } else {
        return phoneNumber(value);
      }
    }
  }

  static String? fullName(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter full name';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter phone number';
    }

    return null;
  }

  static String? emailAddress(String? value) {
    if (value?.isNotEmpty ?? false) {
      if (isEmailValid(value!)) {
        return null;
      } else {
        return 'Enter valid Email address';
      }
    } else {
      return 'Please enter email address';
    }
  }

  static String? password(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter password';
    }
    if ((value?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? newPassword(String currentPassword, String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter new password';
    }
    if ((value?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (value == currentPassword) {
      return 'New password must be different from current password';
    }
    return null;
  }

  static String? confirmPassword(String password, String? value) {
    if (value != null && value.isEmpty) {
      return 'Please re-enter password';
    } else {
      if (password != value) {
        return 'Password does not match';
      }
    }
    return null;
  }

  static InputType checkInputType(String string) {
    num? number = num.tryParse(string);
    if (number == null) {
      return InputType.email;
    } else {
      return InputType.mobile;
    }
  }

  static bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
