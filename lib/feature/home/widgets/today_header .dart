import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/functions/navigation.dart';
import 'package:taskatii/core/services/app_local_storage.dart';
import 'package:taskatii/core/utils/colors.dart';
import 'package:taskatii/core/utils/text_Styles.dart';
import 'package:taskatii/core/widgets/custom_button.dart';
import 'package:taskatii/feature/add_task/add_task_screen.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
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
                DateFormat('dd MMM,yyyy').format((DateTime.now())),
                style: getTitleTextStyle(
                    fontSize: 19, color: AppColor.primaryColor),
              ),
              Text(
                'Today',
                style: getTitleTextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomButton(
            width: 135,
            text: 'Add Task',
            onPressed: () {
              pushTo(context, const AddTaskScreen());
            })
      ],
    );
  }
}
