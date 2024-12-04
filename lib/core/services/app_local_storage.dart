import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskatii/core/model/task_model.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box<TaskModel> taskBox;
  static String nameKey = 'name';
  static String imageKey = 'image';
  static String isuploadKey = 'isUpload';
  static init() {
    userBox = Hive.box('user');
    taskBox = Hive.box<TaskModel>('task');
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getCacheData(String key) {
    return userBox.get(key);
  }

  static cacheTaskData(String key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getCacheTaskData(String key) {
    return taskBox.get(key);
  }
}
// var box = Hive.box('user');
//                   await box.put('isupload', true);
//                   pushWithReplacement(context, const HomeScreen());