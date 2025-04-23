import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../domain/config/route/route_const.dart';
import '../domain/models/on_board_model.dart';
import '../domain/usecase/is_first_time_opened.dart';
import '../domain/usecase/set_opened_status.dart';

class OnBoardController extends GetxController {
  final RxInt currentIndexOnBoard = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  final IsFirstTimeOpenedUsecase isFirstTimeOpenedUsecase;
  final SetOpenedStatusUsecase setOpenedStatusUsecase;

  OnBoardController(this.isFirstTimeOpenedUsecase, this.setOpenedStatusUsecase);

  final List<OnBoardModel> onBoardItemList = [
    OnBoardModel(
      heading: "Smart Learning Platform",
      subHeading: "Personalized study plans, adaptive assessments, and expert guidance all in one place",
    ),
    OnBoardModel(heading: "Join Success Stories", subHeading: "100,000+ students already achieving their goals"),
    OnBoardModel(heading: "Learn Better, Score Higher", subHeading: "Achieve your dream scores with our proven learning methodology"),
  ];

  void onPageChangeOnBoard(int value) {
    currentIndexOnBoard.value = value;
  }

  Future<void> onAppOpened() async {
    try {
      final bool isFirstTime = await isFirstTimeOpenedUsecase();
      await Future.delayed(const Duration(seconds: 2));

      if (isFirstTime) {
        Get.offAllNamed(welcomeViewRoute);
      } else {
        Get.offAllNamed(landingViewRoute);
      }
    } catch (e) {
      Get.offAllNamed(welcomeViewRoute);
    }
  }

  Future<void> onMoveToLandingPage() async {
    await setOpenedStatusUsecase(params: false);
    Get.offAllNamed(landingViewRoute);
  }
}
