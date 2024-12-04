import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatii/core/model/task_model.dart';
import 'package:taskatii/core/services/app_local_storage.dart';
import 'package:taskatii/core/utils/colors.dart';
import 'package:taskatii/core/utils/text_Styles.dart';
import 'package:taskatii/feature/home/widgets/task_item.dart';
import 'package:taskatii/feature/home/widgets/home_header.dart';
import 'package:taskatii/feature/home/widgets/today_header%20.dart';
import 'package:taskatii/feature/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user');
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const HomeHeader(),
            const Gap(15),
            const TodayHeader(),
            const Gap(15),
            DatePicker(
              width: 80,
              height: 100,
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColor.primaryColor,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                setState(() {
                  selectedDate = DateFormat('dd/MM/yyyy').format(date);
                });
                // New date selected
                // setState(() {
                //   _selectedValue = date;
                // });
              },
            ),
            const Gap(15),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: AppLocalStorage.taskBox.listenable(),
                builder: (contex, box, child) {
                  List<TaskModel> tasks = [];
                  for (var element in box.values) {
                    if (element.date == selectedDate) {
                      tasks.add(element);
                    }
                  }
                  if (tasks.isEmpty) {
                    return Column(
                      children: [
                        Lottie.asset('assets/images/empty.json'),
                        Text(
                          'No Tasks For $selectedDate',
                        )
                      ],
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Dismissible(
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              box.put(
                                  tasks[index].id,
                                  TaskModel(
                                      title: tasks[index].title,
                                      note: tasks[index].note,
                                      date: tasks[index].date,
                                      startTime: tasks[index].startTime,
                                      endTime: tasks[index].endTime,
                                      color: 3,
                                      isCompleted: true,
                                      id: tasks[index].id));
                            } else {
                              box.delete(tasks[index].id);
                            }
                          },
                          key: UniqueKey(),
                          secondaryBackground: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: AppColor.whiteColor,
                                ),
                                Text(
                                  'delete',
                                  style: getBodyTextStyle(context,
                                      color: AppColor.whiteColor),
                                )
                              ],
                            ),
                          ),
                          background: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: AppColor.whiteColor,
                                ),
                                Text(
                                  'complete',
                                  style: getBodyTextStyle(context,
                                      color: AppColor.whiteColor),
                                )
                              ],
                            ),
                          ),
                          child: TaskItem(
                            taskModel: tasks[index],
                          ));
                    },
                    itemCount: tasks.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
