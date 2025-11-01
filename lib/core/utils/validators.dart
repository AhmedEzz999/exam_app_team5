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
    // Simple regex for email validation
    final bool isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    if (!isValidEmail) {
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

    // Egyptian mobile format: 010 / 011 / 012 / 015 + 8 digits
    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');

    if (!phoneRegex.hasMatch(value)) {
      return AppStrings.fieldInvalid.replaceFirst(
        '{field}',
        AppStrings.phoneNumberLabel.toLowerCase(),
      );
    }

    return null;
  }
}
