import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/domain/config/theme/colors.dart';

import '../../application/on_board_controller.dart';
import '../../dependencies_injection.dart';
import '../../domain/constants/assets.dart';

class SplashPage extends StatelessWidget {
   SplashPage({super.key});
  final onBoardController = sl<OnBoardController>();

  @override
  Widget build(BuildContext context) {

    onBoardController.onAppOpened();

    return Scaffold(backgroundColor: ColorConst.primary, body: _body());
  }

  Widget _body() {
    return Stack(children: [Center(child: Image.asset(Assets.splashBgWorld, fit: BoxFit.cover, width: double.infinity, height: 200))]);
  }
}
