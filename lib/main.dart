import 'package:flutter/material.dart';
import 'package:virtualtribe/app.dart';
import 'package:virtualtribe/src/locator.dart';

void main(){
   WidgetsFlutterBinding.ensureInitialized(); //default from flutter.
    setupLocator(); //initialize dependeny injection
  runApp(App());
}


