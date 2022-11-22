import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:todo_yocket/app/data/constants.dart';
import 'package:todo_yocket/app/data/models/todo_model.dart';
import 'package:todo_yocket/app/data/res/color_res.dart';
import 'package:todo_yocket/app/modules/createTodo/views/widgets/change_time_modal_sheet.dart';

class CreateTodoController extends GetxController {
  var titleTextController = TextEditingController().obs;
  var descriptionTextController = TextEditingController().obs;

  var selectedMin = 10.obs;
  var selectedSec = 00.obs;

  onMinutesChanged(int value) {
    selectedMin.value = value;
  }

  changeTime() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (context) => const ChangeTimeModalSheetView());
  }

  onCreateButtonPressed() {
    String title = titleTextController.value.text.trim();
    String description = descriptionTextController.value.text.trim();

    if (title.isEmpty) {
      Constants.showToast('Please enter task title');
      return;
    }
    TodoModel todoModel = TodoModel(
        title, selectedMin.value, selectedSec.value, 0,
        descritpion: description);

    addTaskToList(todoModel);
  }

  onSecChanged(int value) {
    selectedSec.value = value;
    if (selectedMin.value == 10) {
      selectedSec.value = 0;
    }
    if (selectedMin.value == 0 && selectedSec.value == 0) {
      selectedSec.value = 1;
    }
  }

  onMinChanged(int value) {
    selectedMin.value = value;
    if (selectedMin.value == 10) {
      selectedSec.value = 0;
    }
    if (selectedMin.value == 0) {
      selectedSec.value = 1;
    }
  }

  onBackPressed() => Get.back();

  void addTaskToList(TodoModel todoModel) {
    final box = GetStorage();
    List<String> todoModelList = box.read(Constants.TODO_LIST) ?? [];
    todoModelList.add(jsonEncode(todoModel.toJson()));
    box.write(Constants.TODO_LIST, todoModelList);
    HapticFeedback.mediumImpact();
    Get.back();
  }
}
