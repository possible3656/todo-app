import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_yocket/app/modules/home/controllers/home_controller.dart';
import 'package:todo_yocket/app/modules/home/views/widgets/todo_item_grid.dart';
import 'package:todo_yocket/app/modules/home/views/widgets/todo_item_list.dart';

class TodoListView extends GetView<HomeController> {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() => controller.gridSelected.value
            ? const TodoItemGridView()
            : const TodoItemListView()));
  }
}

class TimerView extends GetView<HomeController> {
  final int index;
  const TimerView(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTimer(
        controller: controller.todoModelList[index].getTimerController,
        begin: Duration(
            minutes: controller.todoModelList[index].timeInMin,
            seconds: controller.todoModelList[index].timeInSec),
        end: const Duration(),
        builder: (time) => controller.onTimerChanged(time, index));
  }
}
