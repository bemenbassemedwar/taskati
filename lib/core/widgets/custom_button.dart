
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class custombutton extends StatelessWidget {
  const custombutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: const Text('uploaded image'));
  }
}
