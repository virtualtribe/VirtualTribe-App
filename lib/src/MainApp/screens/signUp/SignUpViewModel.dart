import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/DynamicLinkService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/MainApp/widget/SignUpDialog.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/Api.dart';
import 'package:virtualtribe/src/services/V1API.dart';

class SignUpViewModel extends BaseViewModel{
String _errorMessage;
String get message => _errorMessage;
int _errorMessageType;
int get errorType => _errorMessageType;
 final CustomFunction _customFuntion = locator<CustomFunction>();
 final FirebaseAuth _auth = FirebaseAuth.instance;
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
   final AuthService _authService = locator<AuthService>();
   final NavigationService _navigationService = locator<NavigationService>();
    final API _api = locator<API>();
    final V1API _v1api = locator<V1API>();

showRetryDialog(BuildContext context){
  return showDialog(
            context: context,
            builder: (BuildContext context) {
              return SignUpDialog();});
}


 signIn(String email)async{
   _errorMessage = null;
if(email.isEmpty){
showMessage(error: 'Email is required');
  
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
            setBusy(false);
          }else{
            showMessage(error: 'Not Send', type: 0);
            setBusy(false);
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
        androidPackageName: 'net.virtual.virtualwork',
        handleCodeInApp: true,
        iOSBundleID: 'net.virtual.virtualwork',
        url: Constants.passwordlessDynamicUrl,
  );
 } catch (e) {
      return false;
 }
    return true;
}

Future<bool> _sendEmailandPassword({String providedEmail}) async {
  try {
  _auth.signInAnonymously(
  );
 } catch (e) {
      return false;
    }
    return true;
}

 initializeDynamicLink()async{
   await _dynamicLinkService.handleDynamicLinks(); //Initialize dynamic 
 }
 
 proceed(){
   setBusy(true);
   dynamic _result = _authService.signInAnonymous();
    if(_result != null){
    _navigationService.navigateToandRemove(wrapperRoute);
      setBusy(false);
    }else{
       setBusy(false);
    }
 }


loginWithAPI(){
_api.loginUser().then((value)async{

                    if(value == null){
                      
                        setBusy(false);
                    showMessage(error: value.toString(), type: 0);
                         
                    }else{
                       if(value.user != null){
                       //Successful then Save data to secure storage
                      print(value.user.email);

                         setBusy(false); 
                     }else{
                        //Opps! Failed.
                         showMessage(error: value.error, type: 0);
                            setBusy(false);
                     }
                    }
                  }).catchError((e)async{
                      showMessage(error: e.toString(), type: 0);
                          setBusy(false);
                  });
}


loginwithV2API({String email, String pass})async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
  showMessage(error: null);
  if(email.isEmpty || pass.isEmpty){
showMessage(error: 'All field must be filled');
  
  } else if(email != null){
    print('Am here');
     String check = _customFuntion.validateEmail(email);
    
     if(check != null){
        showMessage(error: 'The email you entered is invalid');

       }else if(email.isNotEmpty){
  setBusy(true); //email pass
_v1api.authenticateUser(username: email, password: pass).then((value)async{
                    if(value == null){
                      print('Value is null');
                        setBusy(false);
                    showMessage(error: value.error, type: 0);
                         
                    }else{
                    print('Token Gotte => ${value.user.authToken}');
                    if(value.user.authToken == null){
                       showMessage(error: value.error, type: 0);
                    }else{
_customFuntion.saveEmailANDToken(
                      email: email,
                      name: value.user.name,
                      token: value.user.authToken,
                      userid: value.user.id,
                      lastActivity: value.user.lastActivity
                    );
                      _navigationService.navigateToandRemove(wrapperRoute);
                    }
                    
                    setBusy(false);
                    }
                  }).catchError((e)async{
                    print('Catch Error here ${e.toString()}');
                      showMessage(error: e.toString(), type: 0);
                          setBusy(false);
                  });
                  }
  }
}
}