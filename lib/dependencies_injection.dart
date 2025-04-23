import 'package:get_it/get_it.dart';
import 'package:kas_mentor_mt/domain/usecase/is_first_time_opened.dart';

import 'application/landing_controller.dart';
import 'application/on_board_controller.dart';
import 'domain/usecase/get_all_data.dart';
import 'domain/usecase/set_opened_status.dart';
import 'infrastructure/datasources/remote/network_helper.dart';
import 'infrastructure/repo_implementations/api_repository_impl.dart';
import 'infrastructure/repo_implementations/shared_repository_imple.dart';
import 'infrastructure/repositories/api_repository.dart';
import 'infrastructure/repositories/shared_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencies
  sl.registerSingleton<NetworkHelper>(NetworkHelper());
  sl.registerSingleton<ApiRepository>(ApiRepositoryImpli(sl()));

  sl.registerSingleton<SharedRepository>(SharedRepositoryImple());

  // Use case
  sl.registerSingleton<GetAllDataUsecase>(GetAllDataUsecase(sl()));
  sl.registerSingleton<IsFirstTimeOpenedUsecase>(IsFirstTimeOpenedUsecase(sl()));
  sl.registerSingleton<SetOpenedStatusUsecase>(SetOpenedStatusUsecase(sl()));

  // Controller
  sl.registerLazySingleton(() => LandingController(sl()));
  sl.registerLazySingleton(() => OnBoardController(sl(), sl()));
}
