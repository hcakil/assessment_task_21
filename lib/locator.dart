import 'package:get_it/get_it.dart';
import 'package:turkaiassessment/repository/auth_repository.dart';
import 'package:turkaiassessment/service/first_service.dart';
import 'package:turkaiassessment/service/second_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => FirstService());
  locator.registerLazySingleton(() => SecondService());
  locator.registerLazySingleton(() => AuthRepository());

}
