import 'package:flutter/material.dart';
import 'package:taskatii/core/utils/colors.dart';

void showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: AppColor.redColor, content: Text(message)));
}
