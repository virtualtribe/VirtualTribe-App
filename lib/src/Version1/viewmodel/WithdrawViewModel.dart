import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class WithdrawViewModel extends BaseViewModel{
String _message; //for displaying Error message or other Good message
String get displayMessage => _message;
final AuthService _authenticationService = locator<AuthService>();
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 String uid;
int _messageType;
  int get displayMessageType => _messageType;
  String bankName, accountNo, accountName; 
  bool loader = false;
  
  proceed({String amounts}){
    showMessage(msg: null);
    
     if(amounts.isEmpty){
 showMessage(msg: 'Please enter amounts', type: 0);
     }else{
        
     }
  }

  showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
} 
  

  initialized( //{}
  {TextEditingController  bankNameController, TextEditingController accountNumberController,
  TextEditingController accountNameController})
     async{
       var user = await _firebaseAuth.currentUser();
      setBusy(true);
      print(_authenticationService.currentUser.bankName);
      print(_authenticationService.currentUser.accountNumber);
      print(_authenticationService.currentUser.accountName);

      bankNameController.text =   _authenticationService.currentUser.bankName;
      accountNumberController.text =  _authenticationService.currentUser.accountNumber;
      accountNameController.text = _authenticationService.currentUser.accountName;
      setBusy(false);
      notifyListeners();
       uid = user.uid;
  }

  
setLoader(bool value){
  loader = value;
  notifyListeners();
}


  }