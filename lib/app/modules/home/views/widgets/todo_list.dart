import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_yocket/app/data/constants.dart';
import 'package:todo_yocket/app/data/models/todo_model.dart';
import 'package:todo_yocket/app/data/res/color_res.dart';
import 'package:todo_yocket/app/modules/home/controllers/home_controller.dart';

class TodoListView extends GetView<HomeController> {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
          itemCount: 1,
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
                                        'Title of task goes here',
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
                                        'description of task goes here',
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
                                            child: Obx(
                                              () => Icon(
                                                !controller.todoModelList[index]
                                                        .paused
                                                    ? Icons.pause_circle
                                                    : Icons.play_circle,
                                                size: 28,
                                                color: ColorRes.primaryText,
                                              ),
                                            ))),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 10, 10),
                                      child: Icon(
                                        Icons.remove_circle,
                                        size: 28,
                                        color: Colors.redAccent,
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
                              Text(
                                '',
                                style: TextStyle(
                                    color: Colors.yellowAccent, fontSize: 12),
                              ),
                              CustomTimer(
                                  controller: controller
                                      .todoModelList[index].getTimerController,
                                  begin: Duration(
                                      minutes: controller
                                          .todoModelList[index].timeInMin,
                                      seconds: controller
                                          .todoModelList[index].timeInSec),
                                  end: const Duration(),
                                  builder: (time) =>
                                      controller.onTimerChanged(time, index)),
                              Obx(
                                () => Text(
                                  Constants.status[controller
                                      .todoModelList[index].getStatus],
                                  style: TextStyle(
                                      color: Colors.yellowAccent, fontSize: 8),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
