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

  var gridSelected = false.obs;

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
    todoModelList.clear();
    for (var str in list) {
      todoModelList.add(TodoModel.fromJson(jsonDecode(str)));
    }
    todoModelList.refresh();
    print(todoModelList);
  }

  onTimerChanged(CustomTimerRemainingTime time, int index) {
    if (time.minutes == '00' && time.seconds == '00') {
      todoModelList[index].setStatus = 2;
      todoModelList[index].paused = true;
      // todoModelList.refresh();
    }

    saveNewList(todoModelList);
    todoModelList[index].timeInMin = int.parse(time.minutes);
    todoModelList[index].timeInSec = int.parse(time.seconds);

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
    saveNewList(todoModelList);
  }

  onRemoveButtonPressed(int index) {
    showDialog(
        context: Get.context!,
        builder: ((context) => AlertDialog(
              title: const Text('Are you sure!'),
              content: const Text('You want to delete this Todo'),
              actions: [
                TextButton(
                    onPressed: (() => Get.back()),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: ColorRes.primaryBackground),
                    )),
                TextButton(
                    onPressed: (() {
                      todoModelList.removeAt(index);
                      saveNewList(todoModelList);
                      Get.back();
                    }),
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.redAccent),
                    )),
              ],
            )));
  }

  saveNewList(todoModelList) {
    List<String> todoModelListString = [];
    for (TodoModel todoModel in todoModelList) {
      todoModelListString.add(jsonEncode(todoModel.toJson()));
    }
    box.write(Constants.TODO_LIST, todoModelListString);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      todoModelList.refresh();
    });
    // print(todoModelList[0].timeInSec);
  }

  onChangeTypePressed() {
    gridSelected.value = !gridSelected.value;
  }
}
