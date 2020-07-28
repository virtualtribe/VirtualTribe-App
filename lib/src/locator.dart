import 'package:get_it/get_it.dart';
import 'package:virtualtribe/src/services/navigation_service.dart';
import 'package:virtualtribe/src/utils/customFunction.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
locator.registerLazySingleton(() => CustomFunction()); //register custom function class as depedency injection
locator.registerLazySingleton(() => NavigationService()); //register navigation class as depedency injection
}