import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/V1API.dart';

// class WrapperViewModel extends BaseViewModel{
// final AuthService _authenticationService = locator<AuthService>();
//   final NavigationService _navigationService = locator<NavigationService>();
//    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//    final API _api = locator<API>();
//    String _errorMessage;
// String get message => _errorMessage;
// int _errorMessageType;
// int get errorType => _errorMessageType;
// final CustomFunction _customFuntion = locator<CustomFunction>();

//   Future  handleStartUp()async{
//    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
//     setBusy(true);

//     if (hasLoggedInUser) {
//         //Check if User data is in the Database.
//         //IF YES, MOVE TO DASHBOD ELSE PROCESS REGISTRATION SCREEN\
//       checking();
//     }else {
//       _navigationService.navigateToandRemove(registerRoute);
//        setBusy(false);
//     }
//   }

//  checking()async{
//     var result = await _authenticationService.checkIfIDExist();

//     if(result){
// //YES DATA EXIST, MOVE TO DASHBOARD
// organisationDetails();
//  _navigationService.navigateToandRemove(v1dashboard);
//     }else{
//       //NO DOESN"T EXIST AT ALL, MOVE TO PROCEED SCREEN
//       organisationDetails();
//       _navigationService.navigateToandRemove(registerdataRoute); // TODO Register Data afresh by inputing details.
//     }
//  } 

 
//  showMessage({String error, int type}){
// _errorMessage = error;
// _errorMessageType = type;
// notifyListeners();
// }

// }

class WrapperViewModel extends BaseViewModel{
final AuthService _authenticationService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
   final V1API _v1api = locator<V1API>();
   String _errorMessage, _errorToken;
String get message => _errorMessage;
String get getErrorToken => _errorToken;
int _errorMessageType;
int get errorType => _errorMessageType;
final CustomFunction _customFuntion = locator<CustomFunction>();

void handleStartUp()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String mytoken = prefs.getString(Constants.userToken);
    int uid = prefs.getInt(Constants.userId);
  print('Saved Token => $mytoken');

    if(mytoken == null){
      
      //Login Page
       _navigationService.navigateToandRemove(registerRoute);
      
    }else{

       var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if (hasLoggedInUser) {
        //Check if User data is in the Database.
        //IF YES, MOVE TO DASHBOD ELSE PROCESS REGISTRATION SCREEN
       var result = await _authenticationService.checkIfIDExist();

    if(result){
      setBusy(false);
//YES DATA EXIST, MOVE TO DASHBOARD
  organisationDetails();
  showMessage(error: null, type: 0,);
    //  Fetc User info here
      _v1api.getUsersList().then((value)async{
           print('Am here....... ${value.error.toString()}');
                    if(value.users == null){
                    if(value.error == 'Invalid app_token'){
                      showMessage(errorToken: value.error, type: 0,);
                       setBusy(false);
                    }else{
                           setBusy(false);
                    showMessage(error: value.error, type: 0,);
                    }
                   

                    }else{

                       if(value.users != null){
                        //  print('Email =>> ${value.users[0].email}');
                        //  print('ID =>> ${value.users[0].id}');
                        for(int i = 0; i < value.users.length; i++){
                         if(value.users[i].id == uid){
                           print('SAME ID => ${value.users[i].id.toString()}');
                            _customFuntion.saveSmallData(
                              name:  value.users[i].name,
                              userid: value.users[i].id,
                              email:  value.users[i].email,
                              lastActivity: value.users[i].lastActivity
                              
                            );
                            _navigationService.navigateToandRemove(v1dashboard);
                         }
                        }
                   
                          setBusy(false); 
                     }else{
                        //Opps! Failed.
                         showMessage(error: value.error, type: 0);
                        
                            setBusy(false);
                     }
                   // showMessage(error: "User Successfully found", type: 1);
                    setBusy(false);
                    }
                  }).catchError((e)async{
                      showMessage(error: e.toString(), type: 0);
                      setBusy(false);
                  });

    }else{
      //IF auth exist but user data not extist goto where will input thier details.
        // TODO Register Data afresh by inputing details.
      _navigationService.navigateToandRemove(registerdataRoute);
    }
    }else{
      //If Auth is null, Goto where user can signUp with FIrebase Anonymous
  _navigationService.navigateToandRemove(onboardRoute); 
    }
    }
}

 showMessage({String error, int type, String errorToken}){
_errorMessage = error;
_errorMessageType = type;
_errorToken = errorToken;
notifyListeners();
}

firebaseWrapper()async{
 var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    setBusy(true);

    if (hasLoggedInUser) {
        //Check if User data is in the Database.
        //IF YES, MOVE TO DASHBOD ELSE PROCESS REGISTRATION SCREEN\
      checking();
    }
}

 checking()async{
    var result = await _authenticationService.checkIfIDExist();

    if(result){
//YES DATA EXIST, MOVE TO DASHBOARD
organisationDetails();
 _navigationService.navigateToandRemove(v1dashboard);
    }else{
      //NO DOESN"T EXIST AT ALL, MOVE TO PROCEED SCREEN
      organisationDetails();
      _navigationService.navigateToandRemove(onboardRoute); // TODO Register Data afresh by inputing details.
    }
 }

 
 organisationDetails(){
   _v1api.getOrganisationDetails().then((value)async{

                    if(value == null){
                      
                        setBusy(false);
                    showMessage(error: value.toString(), type: 0);
                         
                    }else{
                       if(value.organizations != null){
                        //TODO ORAGNIZATION SUCCESS, SAVE DATA TO LOCAL STORAGE......
                        for(int i = 0; i < value.organizations.length; i++){
                          _customFuntion.saveOrganizationDetails(value.organizations[i]);
                        }
 

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

}

