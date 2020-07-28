import 'package:flutter/material.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/route.dart';
import 'package:virtualtribe/src/screens/dashboardUI/DashboardScreen.dart';
import 'package:virtualtribe/src/screens/signUp/SignUpScreen.dart';
import 'package:virtualtribe/src/services/navigation_service.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VirtualTribe',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      home: DashboardScreen(),//SignUpScreen(), 
      onGenerateRoute: generateRoute,
    );
  }
}