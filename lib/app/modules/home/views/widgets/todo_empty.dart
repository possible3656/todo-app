import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_yocket/app/modules/home/controllers/home_controller.dart';

import '../../../../data/res/color_res.dart';

class TodoEmptyView extends GetView<HomeController> {
  const TodoEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Text(
                  'You haven\'t created any todo yet.',
                  style: TextStyle(
                      color: ColorRes.secodaryText,
                      letterSpacing: 1.1,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 0),
                  child: Image.asset(
                    'assets/images/todo8.gif',
                    width: Get.width * .7,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                  width: Get.width * .7,
                  height: 80,
                  child: Image.asset('assets/images/create_todo.png')),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: GestureDetector(
                  onTap: (() => controller.onNewTodoPressed()),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorRes.secondaryBackground,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: ColorRes.primaryText,
                            size: 18,
                          ),
                          Text(
                            'Create',
                            style: TextStyle(
                                color: ColorRes.primaryText, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
