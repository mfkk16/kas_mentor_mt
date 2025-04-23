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

  final List<Widget> _pages = [HomePage(), LearningPage(), MaterialsPage(), MorePage()];
  final landingController = sl<LandingController>();

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
            child: BottomNavigationBar(
              currentIndex: landingController.currentIndex.value,
              onTap: landingController.onPageChange,
              backgroundColor: ColorConst.backgroundWhite,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              elevation: 10,
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
              selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,

              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: ImageIcon(AssetImage(Assets.home), size: 22),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: ImageIcon(AssetImage(Assets.learning), size: 26),
                  ),
                  label: 'Learning',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: ImageIcon(AssetImage(Assets.materials), size: 19),
                  ),
                  label: 'Materials',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 35,
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: ImageIcon(AssetImage(Assets.more), size: 22),
                  ),
                  label: 'More',
                ),
              ],
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
