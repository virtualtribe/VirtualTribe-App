import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/V1API.dart';

class WithdrawViewModel extends BaseViewModel{
String _message; //for displaying Error message or other Good message
String get displayMessage => _message;
final AuthService _authenticationService = locator<AuthService>();
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 String uid;
int _messageType;
  int get displayMessageType => _messageType;
  String bankName, accountNo, accountName, walletBalance; 
  bool loader = false;
final V1API _v1api = locator<V1API>();
final NavigationService _navigationService = locator<NavigationService>();

  proceed({String amounts, String reasons}){
    walletBalance  =  _authenticationService.currentUser.walletBalance;
     int currentBalance = int.parse(walletBalance);
    int  enteredAmounts = int.parse(amounts);
    showMessage(msg: null);
     if(amounts.isEmpty ){
 showMessage(msg: 'Please enter amounts', type: 0);

     }else if(enteredAmounts > currentBalance){
    showMessage(msg: 'Insufficient Fund to withdraw', type: 0);
     }else if(reasons.isEmpty ){
 showMessage(msg: 'Reason Field is empty', type: 0);
     }else{
       //CREATE RECIPENT CODE
       createUserRecipentCode(
          accountNumber: _authenticationService.currentUser.accountNumber,
          bankCode: _authenticationService.currentUser.myBankCode,
         name: '${_authenticationService.currentUser.fullName}Recipent',
          enteredAmounts: amounts
       );
        
     }
  }

  showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
} 

  initialized(
  {TextEditingController  bankNameController, TextEditingController accountNumberController,
  TextEditingController accountNameController})
     async{
       var user = await _firebaseAuth.currentUser();
      setBusy(true);

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
//FIRSTLY CREATE A RECIPENT CODE
//TRANSFER MONEY 1
//FINALISE TRANSFER MONEY

createUserRecipentCode({String name, String accountNumber,
  String bankCode, String enteredAmounts}){
    print('Name: $name accountNumber: $accountNumber, bankCode: $bankCode');

     setBusy(true);
  _v1api.createPaymentCode(
    bankCode: bankCode,
    name: name,
    accountNumber: accountNumber
  ).then((value){

    if(!value.status){
      setBusy(false);
      showMessage(msg: '${value.message} from Me...', type: 0);

    }else{
      //Transfer 1
      print('Amounts => $enteredAmounts');
       print('RecipentCode => ${value.data.recipientCode}');
      transferFund(
        amounts: enteredAmounts,
        reasons: 'No fucking reason',
        recipient: value.data.recipientCode
      );
    }
  });
}

transferFund({String amounts, String recipient, String reasons}){
  _v1api.transferFund(
      amounts: amounts,
      recipient: recipient,
      reasons: reasons
  ).then((value){

 if(!value.status){
      setBusy(false);
      showMessage(msg: value.message, type: 0);

    }else{
      List<String> data = new List<String>(); 
      data.add(value.data.transferCode);
       data.add(amounts);
      //MOVE TO OTP SCREEN

      
      _navigationService.navigateTo(transferOtp, arguments:data);
    }
  });
}
}