import '../constants/app_strings/app_strings.dart';

mixin AppValidators {
  String? validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.usernameLabel,
      );
    }
    if (value.trim().length < 3) {
      return AppStrings.usernameMin;
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.usernameLabel,
      );
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.firstNameLabel.toLowerCase(),
      );
    }
    if (value.trim().length < 3) {
      return AppStrings.firstNameShort;
    }
    if (!RegExp(r"^[a-zA-Z'-]+").hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.firstNameLabel.toLowerCase(),
      );
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.lastNameLabel.toLowerCase(),
      );
    }
    if (value.trim().length < 3) {
      return AppStrings.lastNameShort;
    }
    if (!RegExp(r"^[a-zA-Z'-]+").hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.lastNameLabel.toLowerCase(),
      );
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.emailLabel,
      );
    }
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.emailLabel.toLowerCase(),
      );
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        AppStrings.phoneNumberLabel,
      );
    }
    if (!RegExp(r'^01\d{9}$').hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.phoneNumberLabel.toLowerCase(),
      );
    }
    return null;
  }
}
