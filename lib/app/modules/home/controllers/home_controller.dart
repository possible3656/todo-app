import 'dart:convert';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_yocket/app/data/constants.dart';
import 'package:todo_yocket/app/data/models/todo_model.dart';
import 'package:todo_yocket/app/data/res/color_res.dart';
import 'package:todo_yocket/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxList<TodoModel> todoModelList = <TodoModel>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    checkForPreviousTodos();
    super.onInit();
  }

  onNewTodoPressed() {
    HapticFeedback.mediumImpact();
    Get.toNamed(Routes.CREATE_TODO)?.then((value) => checkForPreviousTodos());
  }

  void checkForPreviousTodos() {
    List list = box.read(Constants.TODO_LIST) ?? [];
    for (var str in list) {
      todoModelList.add(TodoModel.fromJson(jsonDecode(str)));
    }
    print(todoModelList);
  }

  onTimerChanged(CustomTimerRemainingTime time, int index) {
    if (time.minutes == '00' && time.seconds == '00') {
      todoModelList[index].setStatus = 2;
      todoModelList.value = todoModelList.value;
    }
    return Text("${time.minutes}:${time.seconds}",
        style: TextStyle(fontSize: 24.0, color: ColorRes.primaryText));
  }

  onPlayPauseTapped(int index) {
    if (todoModelList[index].status == 0) {
      todoModelList[index].getTimerController.start();
      todoModelList[index].setStatus = 1;
      todoModelList[index].setPaused = false;
    } else {
      if (todoModelList[index].getTimerController.state ==
          CustomTimerState.paused) {
        todoModelList[index].getTimerController.start();
        todoModelList[index].setPaused = false;
      } else {
        todoModelList[index].getTimerController.pause();
        todoModelList[index].setPaused = true;
      }
    }
    todoModelList.refresh();
  }
}
