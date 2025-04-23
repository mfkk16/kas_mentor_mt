import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kas_mentor_mt/domain/config/theme/colors.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';

import '../../application/on_board_controller.dart';
import '../../dependencies_injection.dart';
import '../widgets/curved_background_painter.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final _onBoardController = sl<OnBoardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(height: double.infinity, width: double.infinity, child: CustomPaint(painter: CurvedBackgroundPainter())),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        _onBoardController.onMoveToLandingPage();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.btBlueShaded,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text('Skip'),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _onBoardController.pageController,
                      onPageChanged: (index) {
                        _onBoardController.currentIndexOnBoard.value = index;
                      },
                      children: _onBoardController.onBoardItemList.map((item) => buildPage(item.heading, item.subHeading)).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Obx(() {
                      final isLastPage = _onBoardController.currentIndexOnBoard.value == _onBoardController.onBoardItemList.length - 1;
                      return isLastPage
                          ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: ElevatedButton(
                              onPressed: () {
                                _onBoardController.onMoveToLandingPage();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConst.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(child: const Text("Get Started", style: TextStyle(fontSize: 16))),
                              ),
                            ),
                          )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(_onBoardController.onBoardItemList.length, (index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                width: index == _onBoardController.currentIndexOnBoard.value ? 30 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color:
                                      index == _onBoardController.currentIndexOnBoard.value
                                          ? const Color(0xFF4B89FF)
                                          : const Color(0xFFD8D8D8),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              );
                            }),
                          );
                    }),
                  ),
                  spacerHeight(40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ColorConst.textBlue), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Text(description, style: TextStyle(fontSize: 14, color: ColorConst.textBlue, height: 1.5), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
