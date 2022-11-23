import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_yocket/app/modules/home/controllers/home_controller.dart';
import 'package:todo_yocket/app/modules/home/views/widgets/todo_list.dart';

import '../../../../data/constants.dart';
import '../../../../data/res/color_res.dart';

class TodoItemGridView extends GetView<HomeController> {
  const TodoItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (1 / 1.5),
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(controller.todoModelList.length, (index) {
            return GestureDetector(
              onTap: (() => controller.onPlayPauseTapped(index)),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorRes.secondaryBackground,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CustomTimer(
                              controller: controller
                                  .todoModelList[index].getTimerController,
                              begin: Duration(
                                  minutes:
                                      controller.todoModelList[index].timeInMin,
                                  seconds: controller
                                      .todoModelList[index].timeInSec),
                              end: const Duration(),
                              builder: (time) =>
                                  controller.onTimerChanged(time, index)),
                          Text(
                            Constants.status[
                                controller.todoModelList[index].getStatus],
                            style: const TextStyle(
                                color: Colors.yellowAccent, fontSize: 8),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  controller.todoModelList[index].title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: ColorRes.primaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          if (controller.todoModelList[index].descritpion != '')
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${controller.todoModelList[index].descritpion}',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorRes.secodaryText,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () => controller.onPlayPauseTapped(index),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                  child: Icon(
                                    controller.todoModelList[index]
                                                .timerController.state ==
                                            CustomTimerState.counting
                                        ? Icons.pause_circle
                                        : Icons.play_circle,
                                    size: 28,
                                    color: ColorRes.primaryText,
                                  ))),
                          InkWell(
                            onTap: () =>
                                controller.onRemoveButtonPressed(index),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
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
              ),
            );
          }),
        ));
  }
}
