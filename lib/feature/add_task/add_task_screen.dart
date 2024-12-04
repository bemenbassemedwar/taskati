import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskatii/core/functions/navigation.dart';
import 'package:taskatii/core/model/task_model.dart';
import 'package:taskatii/core/services/app_local_storage.dart';
import 'package:taskatii/core/utils/colors.dart';
import 'package:taskatii/core/utils/text_Styles.dart';
import 'package:taskatii/core/widgets/custom_button.dart';
import 'package:taskatii/feature/home/pages/home_view.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formkey = GlobalKey<FormState>();
  var titleControler = TextEditingController();
  var noteControler = TextEditingController();
  var dateControler = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()));
  var startTimeControler =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  var endTimeControler =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Add Task',
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: getBodyTextStyle(context),
                ),
                const Gap(5),
                TextFormField(
                  controller: titleControler,
                  decoration: InputDecoration(
                    hintText: ('enter title here'),
                    hintStyle: getSmallTextStyle(),
                  ),
                  validator: (value) {
                    const Text('please enter title');
                    return null;
                  },
                ),
                const Gap(15),
                Text(
                  'Note',
                  style: getBodyTextStyle(context),
                ),
                const Gap(5),
                TextFormField(
                  maxLines: 3,
                  controller: noteControler,
                  decoration: InputDecoration(
                      hintText: ('enter note here'),
                      helperStyle: getSmallTextStyle()),
                  validator: (value) {
                    const Text('please enter text');
                    return null;
                  },
                ),
                const Gap(10),
                Text(
                  'Date',
                  style: getBodyTextStyle(context),
                ),
                const Gap(5),
                TextFormField(
                  readOnly: true,
                  controller: dateControler,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030))
                        .then((value) {
                      if (value != null) {
                        dateControler.text =
                            DateFormat('dd/MM/yyyy').format(value);
                      }
                    });
                  },
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month_outlined)),
                ),
                const Gap(8),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Start Time'),
                        const Gap(5),
                        TextFormField(
                          readOnly: true,
                          controller: startTimeControler,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              if (value != null) {
                                startTimeControler.text = value.format(context);
                              }
                            });
                          },
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.access_time)),
                        ),
                      ],
                    )),
                    const Gap(10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('end Time'),
                        const Gap(5),
                        TextFormField(
                          readOnly: true,
                          controller: endTimeControler,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              if (value != null) {
                                endTimeControler.text = value.format(context);
                              }
                            });
                          },
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.access_time)),
                        ),
                      ],
                    ))
                  ],
                ),
                const Gap(30),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: index == 0
                                      ? AppColor.primaryColor
                                      : index == 1
                                          ? AppColor.orangeColor
                                          : AppColor.redColor,
                                  child: (selectedColor == index)
                                      ? Icon(
                                          Icons.check,
                                          color: AppColor.whiteColor,
                                        )
                                      : const SizedBox()),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                        width: 135,
                        text: 'Creat Task',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            String id =
                                DateTime.now().toString() + titleControler.text;
                            AppLocalStorage.cacheTaskData(
                                id,
                                TaskModel(
                                    title: titleControler.text,
                                    note: noteControler.text,
                                    date: dateControler.text,
                                    startTime: startTimeControler.text,
                                    endTime: endTimeControler.text,
                                    color: selectedColor,
                                    isCompleted: false,
                                    id: id));
                          }
                          pushWithReplacement(context, const HomeScreen());
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
