import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskatii/core/model/task_model.dart';
import 'package:taskatii/core/utils/colors.dart';
import 'package:taskatii/core/utils/text_Styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: taskModel.color == 3
            ? Colors.green
            : taskModel.color == 0
                ? AppColor.primaryColor
                : taskModel.color == 1
                    ? AppColor.orangeColor
                    : AppColor.redColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getTitleTextStyle(
                        fontSize: 16, color: AppColor.whiteColor),
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: AppColor.whiteColor,
                        size: 20,
                      ),
                      const Gap(5),
                      Text(
                        '${taskModel.startTime} : ${taskModel.endTime}',
                        style: getSmallTextStyle(color: AppColor.whiteColor),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Text(
                    taskModel.note,
                    style: getTitleTextStyle(
                        fontSize: 16, color: AppColor.whiteColor),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Container(
              width: 1,
              height: 60,
              color: AppColor.whiteColor,
            ),
            const Gap(10),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                taskModel.isCompleted ? 'Completed' : 'TODO',
                style: getSmallTextStyle(
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
