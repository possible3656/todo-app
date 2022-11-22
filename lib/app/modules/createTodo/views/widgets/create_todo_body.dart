import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:todo_yocket/app/modules/createTodo/controllers/create_todo_controller.dart';
import 'package:todo_yocket/app/modules/createTodo/views/widgets/title_text_field.dart';

import '../../../../data/res/color_res.dart';

class CreateTodoBody extends GetView<CreateTodoController> {
  const CreateTodoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          child: Icon(
            Icons.keyboard_backspace_rounded,
            color: ColorRes.primaryText,
          ),
        ),
        Text(
          'Create\nNew Task',
          style: TextStyle(
              color: ColorRes.primaryText,
              fontSize: 28,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        TitleTextFieldView(
            title: 'Task Title',
            hint: 'Enter your task title',
            controller: controller.titleTextController.value),
        const SizedBox(
          height: 20,
        ),
        TitleTextFieldView(
            title: 'Task description',
            hint: 'Enter your task description',
            controller: controller.descriptionTextController.value),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Task time',
          style: TextStyle(
            color: ColorRes.secodaryText,
            fontSize: 14,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTime(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorRes.secondaryBackground),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Minutes',
                          style: TextStyle(
                              color: ColorRes.secodaryText,
                              fontSize: 14,
                              letterSpacing: 1.1),
                        ),
                        Obx(
                          () => Text(
                            '${controller.selectedMin.value}',
                            style: TextStyle(
                                color: ColorRes.primaryText,
                                fontSize: 38,
                                letterSpacing: 1.1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTime(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorRes.secondaryBackground),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Seconds',
                          style: TextStyle(
                              color: ColorRes.secodaryText,
                              fontSize: 14,
                              letterSpacing: 1.1),
                        ),
                        Obx(
                          () => Text(
                            '${controller.selectedSec.value}',
                            style: TextStyle(
                                color: ColorRes.primaryText,
                                fontSize: 38,
                                letterSpacing: 1.1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
