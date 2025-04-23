import 'package:get_it/get_it.dart';

import 'application/landing_controller.dart';
import 'application/on_board_controller.dart';
import 'domain/usecase/get_all_data.dart';
import 'infrastructure/datasources/remote/network_helper.dart';
import 'infrastructure/repo_implementations/api_repository_impl.dart';
import 'infrastructure/repositories/api_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencies
  sl.registerSingleton<NetworkHelper>(NetworkHelper());
  sl.registerSingleton<ApiRepository>(ApiRepositoryImpli(sl()));

  // Use case
  sl.registerSingleton<GetAllDataUsecase>(GetAllDataUsecase(sl()));

  // Controller
  sl.registerLazySingleton(() => LandingController(sl()));
  sl.registerLazySingleton(() => OnBoardController());
}
