
import 'package:stacked/stacked.dart';

import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/DynamicLinkService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class StaffDashoardViewModel extends BaseViewModel{
final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
String title, report, staff;
final NavigationService _navigationService = locator<NavigationService>();
   final AuthService _authenticationService = locator<AuthService>();

// initializeDynamicLink()async{
//    await _dynamicLinkService.handleDynamicLinks(); //Initialize dynamic 
//  }

showData(){
title = _authenticationService.companydata['comapanyName'];//(_authenticationService.currentCompany.comapanyName == null ? "" : _authenticationService.currentCompany.comapanyName);
report = _authenticationService.companydata['reportNo'].toString();//( _authenticationService.currentCompany.reportNo.toString() == null ? "" : _authenticationService.currentCompany.reportNo.toString());
staff =  _authenticationService.companydata['staffNo'].toString();//(_authenticationService.currentCompany.staffNo.toString() == null ? "" : _authenticationService.currentCompany.staffNo.toString());
}

reportScreen(){
  _navigationService.navigateTo(companyReport, arguments: title);
}

}