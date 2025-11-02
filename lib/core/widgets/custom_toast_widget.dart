import 'package:cherry_toast/cherry_toast.dart';
import 'package:exam_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

mixin ShowToasts {
  void successToast(context, {required String title, String? description}) =>
      CherryToast.success(
        title: Text(title, style: AppTextStyles.kBlack16Regular()),
      ).show(context);
  void errorToast(context, {required String title, String? description}) =>
      CherryToast.error(
        title: Text(title, style: AppTextStyles.kBlack16Regular()),
      ).show(context);
}
