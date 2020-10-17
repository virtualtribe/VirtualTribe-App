import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class VerifyDynamicRegisterVM extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();
String _errorMessage;
String get getErrorMessage => _errorMessage;


  initialize({var data, BuildContext context})async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
      String getEnteredEmail =  prefs.getString(Constants.enteredEmail,);
    final FirebaseAuth user = FirebaseAuth.instance;
    print('***** FROM DYNAMIC LINK EnteredEmail is $getEnteredEmail');
    bool validLink = await user.isSignInWithEmailLink(data.toString());
    if (validLink) {
      try {
       AuthResult authResult = await user.signInWithEmailAndLink(email: getEnteredEmail, link: data.toString());
       if(authResult.user.email != null){
         //Move to create Profile.
         _navigationService.navigateToandRemove(dasbhoardRoute);
       }else{
         //Failed
         setErrorMessage(erorr: 'Failed while Register.');
       }
      } catch (e) {
        print(e);
        
      }
    }
  }

  setErrorMessage({String erorr}){
_errorMessage = erorr;
notifyListeners();
}

}