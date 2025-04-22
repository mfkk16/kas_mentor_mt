import 'package:get/get.dart';

class LandingController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void onPageChange(int value) {
    currentIndex.value = value;
  }
}
