import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

void customSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'User created successfully!',
        style: AppTextStyles.kBlack18Regular().copyWith(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 1500),
    ),
  );
}
