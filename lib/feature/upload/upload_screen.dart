import 'package:flutter/material.dart';
import 'package:taskatii/core/utils/colors.dart';
import 'package:taskatii/core/utils/text_Styles.dart';

import '../../core/widgets/custom_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Done',
                style: getBodyTextStyle(color: AppColor.primaryColor),
              ))
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
            ),
            custombutton()
          ],
        ),
      ),
    );
  }
}
