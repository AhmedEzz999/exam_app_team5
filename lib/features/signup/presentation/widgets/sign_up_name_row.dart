import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SignUpNameRow extends StatelessWidget {
  const SignUpNameRow({
    required this.firstNameController,
    required this.lastNameController,
    required this.validators,
    super.key,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final AppValidators validators;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextfield(
            hint: AppStrings.firstNameHint,
            label: AppStrings.firstNameLabel,
            controller: firstNameController,
            validator: validators.validateFirstName,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: CustomTextfield(
            hint: AppStrings.lastNameHint,
            label: AppStrings.lastNameLabel,
            controller: lastNameController,
            validator: validators.validateLastName,
          ),
        ),
      ],
    );
  }
}
