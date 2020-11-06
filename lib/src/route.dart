import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:virtualtribe/src/CompanyApp/screens/CADashboard/CAppDashboardScreen.dart';
import 'package:virtualtribe/src/CompanyApp/screens/CAReport/CAReportScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/OnboardScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/RegisterInformationScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/Settings/SettingsScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/Staff/StaffScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/DashboardScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/signUp/SignUpScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/signUp/VerifyDynamicRegister.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/StaffApp/StaffDasboard/StaffDasbhoard.dart';
import 'package:virtualtribe/src/Version1/MyTransactionsScreen.dart';
import 'package:virtualtribe/src/Version1/PayAStaffScreen.dart';
import 'package:virtualtribe/src/Version1/V1ActivitiesScreen.dart';
import 'package:virtualtribe/src/Version1/V1LisfofStaffUI.dart';
import 'package:virtualtribe/src/Version1/V1SendMoneyScreen.dart';
import 'package:virtualtribe/src/Version1/V1TimesheetScreen.dart';
import 'package:virtualtribe/src/Version1/WithdrawScreen.dart';
import 'package:virtualtribe/src/WrapperScreen.dart'; 
import 'package:virtualtribe/src/Version1/V1Dashboard.dart';
import 'package:virtualtribe/src/Version1/V1ProfileScreen.dart';
import 'package:virtualtribe/src/f.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Onboard Screen Routing.

    case onboardRoute:
    return _getPageRoute(
       routeName: settings.name,
       viewToShow: OnboardScreen(),
     );

    case registerRoute:
    return _getPageRoute(
       routeName: settings.name,
       viewToShow: SignUpScreen(),
     );

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
     
      case signInwithEmailLOADERRoute:
     var values = settings.arguments; //Index to show when going to this page
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: VerifyDynamicRegister(data: values,),
      );

       case companyReport:
     var value = settings.arguments as String; //Index to show when going to this page
      return _getPageRouteTransition(
         pageTransitionType: PageTransitionType.upToDown,
        viewToShow: CAReportScreen(title: value,),
      );
      //
       case wrapperRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WrapperScreen()
      );
      case registerdataRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RegisterInformationScreen()
      );
      //
      case staffDashbordRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StaffDasbhoard()
      );

      case v1dashboard:
      return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.rotate,
       viewToShow: V1Dashboard(),
     ); //

     case profileRoute:
      return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.upToDown,
       viewToShow: V1ProfileScreen(),
     );
     //
     case timesheetRoute:
      return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.downToUp,
       viewToShow: V1TimesheetScreen(),
     );

     //
     case testerRoute:
      return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.downToUp,
       viewToShow: MyHomePage(),
     );

     //
      case activityRoute:
      return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.leftToRight,
       viewToShow: V1ActivitiesScreen(),
     );

     case transactionScreen:
      return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.leftToRight,
       viewToShow: MyTransactionScreens(),
     );

     case sendMoneyRoute:
      return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
       viewToShow: V1SendMoneyScreen(),
     );

     case withdrawRoute:
      return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.leftToRight,
       viewToShow: WithdrawScreen(),
     );

     case allStaffRoute:
     return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.rightToLeft,
       viewToShow: V1LisfofStaffUI(),
     );

     
     case payeachStaffRoute:
      var value = settings.arguments as List<String>; 
     return _getPageRouteTransition(
        pageTransitionType: PageTransitionType.rightToLeft,
       viewToShow: PayAStaffScreen(staffDetails: value,),
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
