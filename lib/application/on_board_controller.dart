import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../domain/models/on_board_model.dart';

class OnBoardController extends GetxController {
  final RxInt currentIndexOnBoard = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  final List<OnBoardModel> onBoardItemList = [
    OnBoardModel(heading: "Smart Learning Platform", subHeading: "Personalized study plans, adaptive assessments, and expert guidance all in one place"),
    OnBoardModel(heading: "Join Success Stories", subHeading: "100,000+ students already achieving their goals"),
    OnBoardModel(heading: "Learn Better, Score Higher", subHeading: "Achieve your dream scores with our proven learning methodology"),
  ];

  void onPageChangeOnBoard(int value) {
    currentIndexOnBoard.value = value;
  }
}
