import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:virtualtribe/src/CompanyApp/screens/CADashboard/CAppDashboardScreen.dart';
import 'package:virtualtribe/src/CompanyApp/screens/CAReport/CAReportScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/Settings/SettingsScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/Staff/StaffScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/DashboardScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/signUp/SignUpScreen.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Onboard Screen Routing.
    case registerRoute:
    return _getPageRoute(
       routeName: settings.name,
       viewToShow: SignUpScreen(),
     );

    //  //Login Screen Routing.
    case dasbhoardRoute:
    return _getPageRouteTransition(
       viewToShow: DashboardScreen(),
        pageTransitionType: PageTransitionType.rotate
     );
     //
case settingRoute:
    return _getPageRouteTransition(
       viewToShow: SettingsScreen(),
        pageTransitionType: PageTransitionType.rightToLeft
     );
     //
     
case staffRoute:
    return _getPageRouteTransition(
       viewToShow: StaffScreen(),
        pageTransitionType: PageTransitionType.scale
     );

     case cAppDashboardRoute:
    return _getPageRouteTransition(
       viewToShow: CAppDashboardScreen(),
        pageTransitionType: PageTransitionType.upToDown
     );

     case cAReportScreen:
     return _getPageRouteTransition(
       viewToShow: CAReportScreen(),
        pageTransitionType: PageTransitionType.upToDown
     );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}


//***** ROUTE TYPE */

//Page Route without transition
PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
       
      ),
      builder: (_) => viewToShow);
}

//Page Route with Transition
PageRoute _getPageRouteTransition({Widget viewToShow, PageTransitionType pageTransitionType}) {
      return PageTransition(child: viewToShow, type: pageTransitionType, duration:  Duration(seconds: 1),
      );
}
