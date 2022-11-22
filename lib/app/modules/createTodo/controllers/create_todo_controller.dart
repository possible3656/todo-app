import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:todo_yocket/app/data/constants.dart';
import 'package:todo_yocket/app/data/res/color_res.dart';

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
        builder: (context) => Container(
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
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: ColorRes.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Minutes',
                          style: TextStyle(
                              color: ColorRes.secodaryText, fontSize: 18),
                        ),
                        NumberPicker(
                            value: selectedMin.value,
                            minValue: 0,
                            infiniteLoop: true,
                            itemWidth: 50,
                            maxValue: 10,
                            textStyle: TextStyle(
                                color: ColorRes.secodaryText, fontSize: 22),
                            selectedTextStyle: TextStyle(
                                color: ColorRes.primaryText, fontSize: 38),
                            onChanged: (value) {
                              selectedMin.value = value;
                              if (selectedMin.value == 10) {
                                selectedSec.value = 0;
                              }
                              if (selectedMin.value == 0) {
                                selectedSec.value = 1;
                              }
                            }),
                        NumberPicker(
                            value: selectedSec.value,
                            minValue: 00,
                            maxValue: 59,
                            itemWidth: 50,
                            infiniteLoop: true,
                            textStyle: TextStyle(
                                color: ColorRes.secodaryText, fontSize: 22),
                            selectedTextStyle: TextStyle(
                                color: ColorRes.primaryText, fontSize: 38),
                            onChanged: (value) {
                              selectedSec.value = value;
                              if (selectedMin.value == 10) {
                                selectedSec.value = 0;
                              }
                            }),
                        Text(
                          'Seconds',
                          style: TextStyle(
                              color: ColorRes.secodaryText, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }

  onCreateButtonPressed() {
    if (titleTextController.value.text.trim().isEmpty) {
      Constants.showToast('Please enter task title');
    }
  }
}
