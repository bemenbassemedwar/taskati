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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                pushTo(context, const HomeScreen());
              },
              child: Text(
                'Done',
                style: getBodyTextStyle(context, color: AppColor.whiteColor),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomButton(
                                  width: double.infinity,
                                  text: 'Upload from camera',
                                  onPressed: () async {
                                    await uploadImage(isCamera: true);
                                  }),
                              const Gap(10),
                              CustomButton(
                                  width: double.infinity,
                                  text: 'Upload from Gallery',
                                  onPressed: () async {
                                    await uploadImage(isCamera: false);
                                  })
                            ],
                          ),
                        );
                      });
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(File(
                            AppLocalStorage.getCacheData(
                                AppLocalStorage.imageKey)))),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.whiteColor),
                          child: const Icon(
                            Icons.camera_alt,
                          ),
                        ))
                  ],
                ),
              ),
              const Gap(30),
              const Gap(28),
              Divider(
                color: AppColor.primaryColor,
                indent: 20,
                endIndent: 20,
              ),
              const Gap(28),
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
        AppLocalStorage.cacheData(AppLocalStorage.imageKey, value.path);
        setState(() {
          Navigator.of(context).pop();
        });
      }
    });
  }
}
