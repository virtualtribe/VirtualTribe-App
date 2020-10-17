import 'package:get_it/get_it.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/DynamicLinkService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/services/Api.dart';
import 'package:virtualtribe/src/services/V1API.dart';
import 'package:virtualtribe/src/services/baseUrl.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  
locator.registerLazySingleton(() => AuthService()); 
locator.registerLazySingleton(() => CustomFunction()); //register custom function class as depedency injection
locator.registerLazySingleton(() => NavigationService()); //register navigation class as depedency injection
locator.registerLazySingleton(() => DynamicLinkService()); //
 locator.registerLazySingleton(() => API()); //
locator.registerLazySingleton(() => V1API());
locator.registerLazySingleton(() => BaseUrl());
}