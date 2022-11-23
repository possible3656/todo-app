import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_yocket/app/modules/home/controllers/home_controller.dart';
import 'package:todo_yocket/app/modules/home/views/widgets/todo_list.dart';

import '../../../../data/constants.dart';
import '../../../../data/res/color_res.dart';

class TodoItemListView extends GetView<HomeController> {
  const TodoItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: controller.todoModelList.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: (() => controller.onPlayPauseTapped(index)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorRes.secondaryBackground,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 0, left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.todoModelList[index].title,
                                      style: TextStyle(
                                          color: ColorRes.primaryText,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${controller.todoModelList[index].descritpion}',
                                      style: TextStyle(
                                          color: ColorRes.secodaryText,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () =>
                                          controller.onPlayPauseTapped(index),
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 10, 10),
                                          child: Icon(
                                            !controller
                                                    .todoModelList[index].paused
                                                ? Icons.pause_circle
                                                : Icons.play_circle,
                                            size: 28,
                                            color: ColorRes.primaryText,
                                          ))),
                                  InkWell(
                                    onTap: () =>
                                        controller.onRemoveButtonPressed(index),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 10, 10),
                                      child: Icon(
                                        Icons.remove_circle,
                                        size: 28,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '',
                              style: TextStyle(
                                  color: Colors.yellowAccent, fontSize: 12),
                            ),
                            TimerView(index),
                            Text(
                              Constants.status[
                                  controller.todoModelList[index].getStatus],
                              style: const TextStyle(
                                  color: Colors.yellowAccent, fontSize: 8),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
