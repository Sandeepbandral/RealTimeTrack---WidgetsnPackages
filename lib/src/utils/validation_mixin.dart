import 'package:real_time_track_package/src/enums/input_type.dart';

mixin ValidationMixin {
  //
  String? emailPhoneNumberValidation(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter Email address or Phone Number';
    } else {
      if (checkInputType(value!) == InputType.email) {
        return emailAddressValidation(value);
      } else {
        return phoneNumberValidation(value);
      }
    }
  }


  String? fullNameValidation(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter full name';
    }
    return null;
  }


  String? phoneNumberValidation(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter phone number';
    }

    return null;
  }

  String? emailAddressValidation(String? value) {
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

  String? passwordValidation(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter password';
    }
    if ((value?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? newPasswordValidation(String currentPassword, String? value) {
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

  String? confirmPasswordValidation(String password, String? value) {
    if (value != null && value.isEmpty) {
      return 'Please re-enter password';
    } else {
      if (password != value) {
        return 'Password does not match';
      }
    }
    return null;
  }

  InputType checkInputType(String string) {
    num? number = num.tryParse(string);
    if (number == null) {
      return InputType.email;
    } else {
      return InputType.mobile;
    }
  }

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
