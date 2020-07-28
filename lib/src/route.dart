import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:virtualtribe/src/screens/dashboardUI/DashboardScreen.dart';
import 'package:virtualtribe/src/screens/signUp/SignUpScreen.dart';
import 'package:virtualtribe/src/utils/constants.dart';


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
