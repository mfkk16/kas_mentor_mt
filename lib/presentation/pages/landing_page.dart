import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kas_mentor_mt/presentation/pages/home_page.dart';
import 'package:kas_mentor_mt/presentation/pages/learning_page.dart';
import 'package:kas_mentor_mt/presentation/pages/more_page.dart';

import '../../application/landing_controller.dart';
import '../../dependencies_injection.dart';
import '../../domain/config/theme/colors.dart';
import '../../domain/constants/assets.dart';
import 'materials_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final List<Widget> _pages = [const HomePage(), LearningPage(), MaterialsPage(), MorePage()];
  final landingController = sl<LandingController>();
  final double iconSize = 25;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          final bool shouldPop = await _onBack(context);
          if (shouldPop) {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConst.backgroundWhite,
          body: _pages[landingController.currentIndex.value],
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            elevation: 0,
            notchMargin: 6.0,
            child: Container(
              height: 70,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: BottomNavigationBar(
                currentIndex: landingController.currentIndex.value,
                onTap: landingController.onPageChange,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(0.4),
                selectedLabelStyle: const TextStyle(color: Colors.white),
                unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(Assets.home, height: iconSize, width: iconSize),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(Assets.learning, height: iconSize, width: iconSize),
                    ),
                    label: 'Learning',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(Assets.materials, height: iconSize, width: iconSize),
                    ),
                    label: 'Materials',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(Assets.more, height: iconSize, width: iconSize),
                    ),
                    label: 'More',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    bool? exitApp = await showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Do you want to exit from the app?', style: TextStyle(fontSize: 15)),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('No')),
            TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Yes')),
          ],
        );
      }),
    );
    return exitApp ?? false;
  }
}
