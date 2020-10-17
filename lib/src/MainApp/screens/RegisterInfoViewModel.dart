import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/FetchBankModel.dart';
import 'package:virtualtribe/src/MainApp/model/UserModel.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/Api.dart';

class RegisterInfoViewModel extends BaseViewModel{
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _message, _message2, _message3; //for displaying Error message or other Good message
  String get displayMessage => _message;
  String get displayMessage2 => _message2;
  String get displayMessage3 => _message3;

  int _messageType, _messageType2, _messageType3;
   int get displayMessageType => _messageType;
   int get displayMessageType2 => _messageType2;
   int get displayMessageType3 => _messageType3;

     final FirestoreService _firestoreService = locator<FirestoreService>();
     final NavigationService _navigationService = locator<NavigationService>();
     
      List<BankData> _fectbankModel = List<BankData>();
      List<BankData> get getbank => _fectbankModel;
      String getAccountName;
      bool loader = false, loader3 = false;

 register({String fullName, String email, 
    String accountNumber, String accountName, String bankName,
  String  homeAddress, String guarantorName, String guarantorNumber, 
  String nameOfNextKinController, String nameOfNextKinPhoneNumberController,
 String phoneN,  String dateoFBirth})async{
     showMessage3(msg: null);

    var user = await _firebaseAuth.currentUser();
    if(fullName.isEmpty || email.isEmpty ||accountNumber.isEmpty
     || accountName.isEmpty || bankName.isEmpty 
     ||  homeAddress.isEmpty ||  guarantorName.isEmpty
      || guarantorNumber.isEmpty ||  nameOfNextKinController.isEmpty  
      || nameOfNextKinPhoneNumberController.isEmpty || phoneN.isEmpty ){

      showMessage3(msg: 'All fields must be fill', type: 0);

      }else if(guarantorNumber.length != 11 || phoneN.length != 11 
      || nameOfNextKinPhoneNumberController.length != 11){
        showMessage3(msg: 'Invalid Phone Number', type: 0);

      }else{
    setLoader3(true);

 try{
     var result =  await _firestoreService.createUser(UserModel(
          id: user.uid,
          fullName: fullName,
          accountNumber: accountNumber,
          accountName: accountName,
          bankName: bankName,
          email: email,
          dateOfBirth: dateoFBirth,
          phoneCode: '+234',
          phoneNumber: phoneN,
          guarantorName: guarantorName,
          guarantorNumber: guarantorNumber,
          homeAddress: homeAddress,
          nameOfNextKinController:  nameOfNextKinController,
          nameOfNextKinPhoneNumberController: nameOfNextKinPhoneNumberController, ));
          
          if(result is String){
             setLoader3(false);
            showMessage3(msg: 'Could not create Profile', type: 0);

          }else{
              setLoader3(false);
             _navigationService.navigateToandRemove(wrapperRoute);
          }
            setLoader3(false);

 }catch(e){
   showMessage3(msg: e.toString(), type: 0);
    setLoader3(false);
 }
 }

 }
final API _api = locator<API>();

 //FOr displaying Message
showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
} 

showMessage2({String msg, int type}){
  _message2 = msg;
  _messageType2 = type;
  notifyListeners();
} 
showMessage3({String msg, int type}){
  _message3 = msg;
  _messageType3 = type;
  notifyListeners();
} 


fetchBanks(){
  showMessage(msg: null);
  setBusy(true);
_api.getBanks().then((value)async{

                    if(value == null){
                        setBusy(false);
                    showMessage(msg: value.message, type: 0);
                         
                    }else{
                       if(value.data.length == 0){ 
                        //Opps! Failed.
                         showMessage(msg: value.message, type: 0);
                            setBusy(false);
                 _fectbankModel = null;
               }else{
for (var index = 0; index < value.data.length; index++) {
           print(value.data[index].name);
            _fectbankModel.add(
                  BankData(
                    code: value.data[index].code,
                    name: value.data[index].name,
                    )
              );
  } 
  setBusy(false);
   } 
  }
                  }).catchError((e)async{
                      showMessage(msg: e.toString(), type: 0);
                          setBusy(false);
                  });
}

List<BankData> getBank() {
     return _fectbankModel;
   }

   fetchingBankInfo({String accountNo, String code, TextEditingController acctcontroller}){ //
   showMessage2(msg: null);
      setLoader(true);

     _api.getBankInfo(accountNumber: accountNo, bankCode: code).then((value)async{
                    if(value == null){
                        setLoader(false);
                    showMessage2(msg: value.message, type: 0);
                     print('Error >>>>> ${value.message}');
                         
                    }else{
                       if(value.data != null){
                     getAccountName = value.data.accountName;
                     acctcontroller.text = value.data.accountName;
                         setLoader(false); 
                     }else{
                        //Opps! Failed.
                         showMessage2(msg: value.message, type: 0);
                            setLoader(false);
                             print('Error >>>>> ${value.message}');
                     }
                    }
                  }).catchError((e)async{
                      showMessage2(msg: e.toString(), type: 0);
                          setLoader(false);
                  });

   }
   
   setLoader(bool value){
     loader = value;
     notifyListeners();
   }
   
   setLoader3(bool value){
     loader3 = value;
     notifyListeners();
   }

}