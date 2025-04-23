import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kas_mentor_mt/domain/config/route/route_const.dart';
import 'package:kas_mentor_mt/domain/config/theme/colors.dart';

import '../../domain/constants/assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(welcomeViewRoute);
    });

    return Scaffold(backgroundColor: ColorConst.primary, body: _body());
  }

  Widget _body() {
    return Stack(children: [Center(child: Image.asset(Assets.splashBgWorld, fit: BoxFit.cover, width: double.infinity, height: 200))]);
  }
}
