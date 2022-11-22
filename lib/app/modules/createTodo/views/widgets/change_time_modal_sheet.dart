import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:todo_yocket/app/data/res/color_res.dart';
import 'package:todo_yocket/app/modules/createTodo/controllers/create_todo_controller.dart';

class ChangeTimeModalSheetView extends GetView<CreateTodoController> {
  const ChangeTimeModalSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorRes.primaryBackground,
        ),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => controller.onBackPressed(),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      'Done',
                      style: TextStyle(
                          color: ColorRes.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Minutes',
                      style:
                          TextStyle(color: ColorRes.secodaryText, fontSize: 18),
                    ),
                    NumberPicker(
                        value: controller.selectedMin.value,
                        minValue: 0,
                        infiniteLoop: true,
                        itemWidth: 50,
                        maxValue: 10,
                        textStyle: TextStyle(
                            color: ColorRes.secodaryText, fontSize: 22),
                        selectedTextStyle: TextStyle(
                            color: ColorRes.primaryText, fontSize: 38),
                        onChanged: (value) => controller.onMinChanged(value)),
                    NumberPicker(
                        value: controller.selectedSec.value,
                        minValue: 00,
                        maxValue: 59,
                        itemWidth: 50,
                        infiniteLoop: true,
                        textStyle: TextStyle(
                            color: ColorRes.secodaryText, fontSize: 22),
                        selectedTextStyle: TextStyle(
                            color: ColorRes.primaryText, fontSize: 38),
                        onChanged: (value) => controller.onSecChanged(value)),
                    Text(
                      'Seconds',
                      style:
                          TextStyle(color: ColorRes.secodaryText, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
