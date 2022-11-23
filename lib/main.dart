import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_yocket/app/data/res/color_res.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Todo-yocket",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
          splashColor: ColorRes.primaryBackground,
          backgroundColor: ColorRes.primaryBackground,
          fontFamily: 'poppins'),
    ),
  );
}
