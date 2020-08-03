import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/MainApp/widget/SignUpDialog.dart';
import 'package:virtualtribe/src/locator.dart';

class SignUpViewModel extends BaseViewModel{
String _errorMessage;
String get errorM => _errorMessage;
int _errorMessageType;
int get errorType => _errorMessageType;

 final CustomFunction _customFuntion = locator<CustomFunction>();
 final FirebaseAuth _auth = FirebaseAuth.instance;

showRetryDialog(BuildContext context){
  return showDialog(
            context: context,
            builder: (BuildContext context) {
              return SignUpDialog();});
}


 signIn(String email)async{
if(email.isEmpty){
showMessage(error: 'Email required');
  
  } else if(email != null){
    print('Am here');
     String check = _customFuntion.validateEmail(email);
    
     if(check != null){
        showMessage(error: 'The email you entered is invalid');

       }else if(email.isNotEmpty){
         setBusy(true);
     bool sent = await _sendLinkToProvidedEmail(providedEmail: email);
     if(sent){
       _customFuntion.entredEmail(email); //save enteredEmail
       showMessage(error: 'Link sent to $email,', type: 1);
     }else{
       showMessage(error: 'Not Send', type: 0);
     }
  
  }
  }
 }
 showMessage({String error, int type}){
_errorMessage = error;
_errorMessageType = type;
notifyListeners();
}

Future<bool> _sendLinkToProvidedEmail({String providedEmail}) async {
  try {
  _auth.sendSignInWithEmailLink(
    email: providedEmail,
    androidInstallIfNotAvailable: true,
    androidMinimumVersion: '18',
        androidPackageName: 'com.virtualtribe.virtualwork',
        handleCodeInApp: true,
        iOSBundleID: 'com.virtualtribe.virtualwork',
        url: Constants.passwordlessDynamicUrl
  );
 } catch (e) {
      return false;
    }
   
    return true;
  
}
 

}