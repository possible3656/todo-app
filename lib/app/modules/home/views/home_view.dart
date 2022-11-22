import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_yocket/app/data/res/color_res.dart';
import 'package:todo_yocket/app/modules/home/views/widgets/todo_empty.dart';
import 'package:todo_yocket/app/modules/home/views/widgets/todo_list.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.primaryBackground,
        appBar: AppBar(
          backgroundColor: ColorRes.secondaryBackground,
          elevation: 0,
          title: Text(
            'Todo-yocket',
            style: TextStyle(color: ColorRes.primaryText),
          ),
        ),
        body: Obx(() => controller.todoModelList.isEmpty
            ? const TodoEmptyView()
            : const TodoListView()));
  }
}
