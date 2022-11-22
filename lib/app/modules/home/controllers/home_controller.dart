import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_yocket/app/data/models/todo_model.dart';
import 'package:todo_yocket/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxList<TodoModel> todoModelList = <TodoModel>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    checkForPreviousTodos();
    super.onInit();
  }

  onNewTodoPressed() {
    HapticFeedback.mediumImpact();
    Get.toNamed(Routes.CREATE_TODO);
  }

  void checkForPreviousTodos() {
    if (box.read('todos') != null) {
      todoModelList.value = box.read('todos');
    }
  }
}
