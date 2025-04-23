import 'package:get/get.dart';

import '../domain/core/resource/data_state.dart';
import '../domain/usecase/get_all_data.dart';

class LandingController extends GetxController {
  final RxInt currentIndex = 0.obs;
  RxBool isLoading = false.obs;
  Rx<Future<DataState>?> dataFuture = Rx<Future<DataState>?>(null);

  void onPageChange(int value) {
    currentIndex.value = value;
  }

  final GetAllDataUsecase _getAllDataUsecase;

  LandingController(this._getAllDataUsecase);

  Future<DataState> fetchAllData() async {
    isLoading.value = true;
    var resAllData = await _getAllDataUsecase();
    isLoading.value = false;

    if (resAllData is DataFailed) {
      Get.snackbar("Error", resAllData.dataError?.errorMessage ?? "Something went wrong", snackPosition: SnackPosition.BOTTOM);
    }

    return resAllData;
  }

  void loadData() {
    dataFuture.value = fetchAllData();
    update();
  }
}
