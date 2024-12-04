import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskatii/core/functions/dailogs.dart';
import 'package:taskatii/core/functions/navigation.dart';
import 'package:taskatii/core/services/app_local_storage.dart';
import 'package:taskatii/core/utils/colors.dart';
import 'package:taskatii/core/utils/text_Styles.dart';
import 'package:taskatii/feature/home/pages/home_view.dart';

import '../../core/widgets/custom_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                if (path == null && name.isEmpty) {
                  showErrorDialog(
                      context, 'Please upload your image and enter your name');
                } else if (path == null && name.isNotEmpty) {
                  showErrorDialog(context, 'Please upload your image');
                } else if (path != null && name.isEmpty) {
                  showErrorDialog(context, 'Please enter your name');
                } else {
                  AppLocalStorage.cacheData(AppLocalStorage.nameKey, name);
                  AppLocalStorage.cacheData(AppLocalStorage.imageKey, path);
                  AppLocalStorage.cacheData(AppLocalStorage.isuploadKey, true);
                  pushWithReplacement(context, const HomeScreen());
                }
              },
              child: Text(
                'Done',
                style: getBodyTextStyle(
                  context,
                ),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: path != null
                    ? Image.file(File(path!)).image
                    : const AssetImage('assets/images/user.png'),
                backgroundColor: AppColor.primaryColor,
              ),
              const Gap(30),
              CustomButton(
                  text: 'Upload from camera',
                  onPressed: () async {
                    await uploadImage(isCamera: true);
                  }),
              const Gap(10),
              CustomButton(
                  text: 'Upload from Gallery',
                  onPressed: () async {
                    await uploadImage(isCamera: false);
                  }),
              const Gap(28),
              Divider(
                color: AppColor.primaryColor,
                indent: 20,
                endIndent: 20,
              ),
              const Gap(28),
              TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    hintText: ('Enter your name here'),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  uploadImage({required bool isCamera}) async {
    await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
      }
    });
  }
}
