import 'package:get/get.dart';

class Constants {
  static showToast(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: const Duration(seconds: 3),
    ));
  }

  ///////////////////////////////////
  static String TODO_LIST = 'todo_list';

  static List status = ['TODO', 'IN-PROGRESS', 'DONE'];
}
