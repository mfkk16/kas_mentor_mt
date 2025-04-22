import 'package:get_it/get_it.dart';

import 'application/landing_controller.dart';
import 'infrastructure/datasources/remote/network_helper.dart';
import 'infrastructure/repo_implementations/api_repository_impl.dart';
import 'infrastructure/repositories/api_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencies
  sl.registerSingleton<NetworkHelper>(NetworkHelper());
  sl.registerSingleton<ApiRepository>(ApiRepositoryImpli(sl()));


  // Use case


  // Controller
  sl.registerLazySingleton(() => LandingController());
}
