import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class OnboardViewModel  extends BaseViewModel{ 
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _message; //for displaying Error message or other Good message
  String get displayMessage => _message;
     final NavigationService _navigationService = locator<NavigationService>();
    final AuthService _auth = locator<AuthService>();
     int _messageType;
    int get displayMessageType => _messageType;

register(){
    setBusy(true);
    dynamic _result = _auth.signInAnonymous();
    if(_result != null){
      print(_result.toString());
      setBusy(false);
      _navigationService.navigateToandRemove(registerdataRoute);
}else{
      setBusy(false);
      showMessage(msg: "Authentication failed, Please retry", type: 0);
    }
}

//FOr displaying Message
 showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
 } 
 }