import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskatii/core/functions/navigation.dart';
import 'package:taskatii/core/services/app_local_storage.dart';
import 'package:taskatii/core/utils/colors.dart';
import 'package:taskatii/core/utils/text_Styles.dart';
import 'package:taskatii/feature/profile/profile_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello ${AppLocalStorage.getCacheData(AppLocalStorage.nameKey)}',
                style: getTitleTextStyle(
                    fontSize: 19, color: AppColor.primaryColor),
              ),
              Text(
                'Have a nice day',
                style: getSmallTextStyle(),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            pushTo(context, const ProfileScreen());
          },
          child: CircleAvatar(
            radius: 30,
            backgroundImage: FileImage(
                File(AppLocalStorage.getCacheData(AppLocalStorage.imageKey))),
          ),
        ),
      ],
    );
  }
}
