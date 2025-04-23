import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/config/route/route_const.dart';
import '../domain/config/route/router.dart';
import '../domain/config/theme/theme.dart';
import '../domain/constants/string_const.dart';
import 'landing_controller.dart';
import 'on_board_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConst.appName,
      theme: AppTheme.lightTheme,
      initialRoute: splashViewRoute,
      getPages: Routes.generateRoute,
      unknownRoute: Routes.errorViewRoute,
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(OnBoardController());
        Get.put(LandingController());
      }),
    );
  }
}
