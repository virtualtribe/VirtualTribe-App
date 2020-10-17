import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/DynamicLinkService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class DashboardViewModel extends BaseViewModel{
final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
String title, report, staff;
final NavigationService _navigationService = locator<NavigationService>();
   final AuthService _authenticationService = locator<AuthService>();

showData()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
  title = prefs.getString(Constants.organizationName);
  report = '15'; 
  staff = '10';
}

reportScreen(){
  _navigationService.navigateTo(companyReport, arguments: title);
}

}