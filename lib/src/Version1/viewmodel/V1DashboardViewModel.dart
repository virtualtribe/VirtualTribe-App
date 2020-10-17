import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class V1DashboardViewModel extends BaseViewModel{
final NavigationService _navigationService = locator<NavigationService>();

gotoProfile(){
  _navigationService.navigateTo(profileRoute);//
}

gotoTimesheet(){
   _navigationService.navigateTo(timesheetRoute);
}


gotoActivities(){
   _navigationService.navigateTo(activityRoute);
}
}