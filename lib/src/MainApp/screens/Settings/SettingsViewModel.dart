import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/CompanyModel.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class SettingsViewModel extends BaseViewModel{
   final FirebaseAuth _auth = FirebaseAuth.instance;
   final NavigationService _navigationService = locator<NavigationService>();
   final AuthService _authenticationService = locator<AuthService>();
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _message; //for displaying Error message or other Good message
  String get displayMessage => _message;
  int _messageType; //For displaying error message type 1 = Red, 2 => Green
   int get displayMessageType => _messageType;
     final FirestoreService _firestoreService = locator<FirestoreService>();
    // String title,staff; int reportType;
int freq;

showData({TextEditingController title, TextEditingController staffNo, }){
title.text =  _authenticationService.companydata['comapanyName']; //_authenticationService.currentCompany.comapanyName;
freq = _authenticationService.companydata['reportFrequency'];//_authenticationService.currentCompany.reportFrequency;
staffNo.text = _authenticationService.companydata['staffNo'].toString();// _authenticationService.currentCompany.staffNo.toString();
}

   logout(){
     _auth.signOut();
     _navigationService.navigateToandRemove(registerRoute);
   }

    initialized({TextEditingController fullName, TextEditingController email, 
    TextEditingController bankNo, TextEditingController bankName, TextEditingController accountName, 
 TextEditingController phoneN}){
  //Getting data in input inside textfield.
   email.text =  _authenticationService.currentUser.email;
  fullName.text = _authenticationService.currentUser.fullName;
  bankNo.text = _authenticationService.currentUser.accountNumber;
  bankName.text = _authenticationService.currentUser.bankName;
  accountName.text = _authenticationService.currentUser.accountName;
  phoneN.text = _authenticationService.currentUser.phoneNumber;
      }


      proceedToCreateCompanY({int reportType, String companyName, int staffNo})async{
 
    var user = await _firebaseAuth.currentUser();
    setBusy(true);
 try{
     var result =  await _firestoreService.createCompany(CompanyModel(
         comapanyName: companyName,
         reportFrequency: reportType,
         staffNo: staffNo,
         reportNo: 0 //by default.
          ));
          if(result is String){
             setBusy(false);
            showMessage(msg: 'Could not create Company', type: 0);
          }else{
              setBusy(false);
           showMessage(msg: 'Company succesfully Update', type: 1);
          }
            setBusy(false);

 }catch(e){
   showMessage(msg: e.toString(), type: 0);
    setBusy(false);
 }

      }

//FOr displaying Message
showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
} 

}