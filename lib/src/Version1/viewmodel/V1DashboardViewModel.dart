import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class V1DashboardViewModel extends BaseViewModel{
final NavigationService _navigationService = locator<NavigationService>();
String companyName, walletBalance, name;
final AuthService _authenticationService = locator<AuthService>();
final formatAmounts = new NumberFormat("#,##0.00", "en_US");

gotoProfile(){
  _navigationService.navigateTo(profileRoute);
}

initialized()
  async{
      setBusy(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      companyName =  prefs.getString(Constants.organizationName);
      name =  prefs.getString(Constants.name);
      walletBalance = formatAmounts.format(double.parse(_authenticationService.currentUser.walletBalance));
      setBusy(false);
       notifyListeners();
}

gotoTimesheet(){
   _navigationService.navigateTo(timesheetRoute);
}

gotoActivities(){
   _navigationService.navigateTo(activityRoute);
}

gotoWalletHistory(){
   _navigationService.navigateTo(transactionScreen);
}

gotoWithraw(){
    _navigationService.navigateTo(withdrawRoute);
}

gotoSendMoney(){
  _navigationService.navigateTo(sendMoneyRoute);
}

gotoViewAllStaff(){
   _navigationService.navigateTo(allStaffRoute);
}

}