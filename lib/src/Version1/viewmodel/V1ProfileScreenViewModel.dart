import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/FetchBankModel.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/Api.dart';

class V1ProfileScreenViewModel extends BaseViewModel{
final FirebaseAuth _auth = FirebaseAuth.instance;
   final NavigationService _navigationService = locator<NavigationService>();
   final AuthService _authenticationService = locator<AuthService>();
   bool getEdit = true;
   String _message;
   String get displayMessage => _message;
   int _messageType;
   int get displayMessageType => _messageType;
   final API _api = locator<API>();
   List<BankData> _fectbankModel = List<BankData>();
      List<BankData> get getbank => _fectbankModel;
        String getAccountName;
         final CustomFunction _customFuntion = locator<CustomFunction>();

   
 logout(){
     _auth.signOut();
     _navigationService.navigateToandRemove(registerRoute);
   }
 

   initialized({TextEditingController emailController, TextEditingController fullNameController, 
    TextEditingController userIdController,  TextEditingController lastActivitiesController,
       TextEditingController phoneNumberController, TextEditingController accountNumberController, 
      TextEditingController bankNameController, TextEditingController accountNameController, 
      TextEditingController homeAddressController, TextEditingController guarantorNumberController, TextEditingController guarantorNameController,
      TextEditingController nameOfNextKinController, TextEditingController nameOfNextKinPhoneNumberController,
      TextEditingController dateOfBirth
  })async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setBusy(true);
      emailController.text =  prefs.getString(Constants.email);
      userIdController.text =  prefs.getInt( Constants.userId).toString();
      fullNameController.text = prefs.getString(Constants.name);
       lastActivitiesController.text = prefs.getString(Constants.activityTime);
        emailController.text =  _authenticationService.currentUser.email;
        phoneNumberController.text = _authenticationService.currentUser.phoneNumber;
        accountNumberController.text = _authenticationService.currentUser.accountNumber;
        bankNameController.text = _authenticationService.currentUser.bankName;
        accountNameController.text = _authenticationService.currentUser.accountName;
        homeAddressController.text = _authenticationService.currentUser.homeAddress;
          guarantorNumberController.text = _authenticationService.currentUser.guarantorNumber;
          guarantorNameController.text = _authenticationService.currentUser.guarantorName;
            nameOfNextKinController.text = _authenticationService.currentUser.nameOfNextKinController;
            nameOfNextKinPhoneNumberController.text = _authenticationService.currentUser.nameOfNextKinPhoneNumberController;
              dateOfBirth.text = _authenticationService.currentUser.dateOfBirth;
        
        fetchBanks(
        emailCon: emailController,
        nameCon: fullNameController,);
}

editable({bool value}){
  getEdit = value;
  notifyListeners();
  _customFuntion.toastMessage(message: 'Edit is Enabled');
}


fetchBanks({TextEditingController emailCon, TextEditingController nameCon})async{
  showMessage(msg: null);
  SharedPreferences prefs = await SharedPreferences.getInstance();
   emailCon.text = prefs.getString(Constants.email);
     nameCon.text = prefs.getString(Constants.name);
    
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
           //print(value.data[index].name);
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
   
   showMessage(msg: null);
      setBusy(true);

     _api.getBankInfo(accountNumber: accountNo, bankCode: code).then((value)async{
                    if(value == null){
                        setBusy(false);
                    showMessage(msg: value.message, type: 0);
                     print('Error >>>>> ${value.message}');
                         
                    }else{
                       if(value.data != null){
                     getAccountName = value.data.accountName;
                     acctcontroller.text = value.data.accountName;
                         setBusy(false); 
                     }else{
                        //Opps! Failed.
                         showMessage(msg: value.message, type: 0);
                            setBusy(false);
                             print('Error >>>>> ${value.message}');
                     }
                    }
                  }).catchError((e)async{
                      showMessage(msg: e.toString(), type: 0);
                          setBusy(false);
                  });

   }
   showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
} 
}