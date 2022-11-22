import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:todo_yocket/app/modules/createTodo/views/widgets/create_todo_body.dart';
import 'package:todo_yocket/app/modules/createTodo/views/widgets/title_text_field.dart';

import '../../../data/res/color_res.dart';
import '../controllers/create_todo_controller.dart';

class CreateTodoView extends GetView<CreateTodoController> {
  const CreateTodoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.primaryBackground,
      // appBar: AppBar(
      //   backgroundColor: ColorRes.secondaryBackground,
      //   elevation: 0,
      //   title: Text(
      //     'Create',
      //     style: TextStyle(color: ColorRes.primaryText),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateTodoBody(),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => controller.onCreateButtonPressed(),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorRes.secondaryBackground),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Create Task',
                          style: TextStyle(
                              color: ColorRes.primaryText, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
