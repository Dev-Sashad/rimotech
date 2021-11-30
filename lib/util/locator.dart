import 'package:get_it/get_it.dart';
import 'package:rimotech/core/services/authentication_services.dart';
import 'package:rimotech/core/services/navigation_service.dart';
import 'package:rimotech/util/progressBarManager/progressService.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => ProgressService());
}
