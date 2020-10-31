import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class V1ProfileScreenViewModel extends BaseViewModel{
final FirebaseAuth _auth = FirebaseAuth.instance;
   final NavigationService _navigationService = locator<NavigationService>();
   final AuthService _authenticationService = locator<AuthService>();

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
        setBusy(false);

      }
}