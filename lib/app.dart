import 'package:flutter/material.dart';
import 'package:virtualtribe/src/WrapperScreen.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/route.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';

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
       onGenerateRoute: generateRoute,
       home: WrapperScreen()
     );
  }
}