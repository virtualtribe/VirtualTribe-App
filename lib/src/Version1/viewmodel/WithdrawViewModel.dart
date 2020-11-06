import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';

class WithdrawViewModel extends BaseViewModel{
String _message; //for displaying Error message or other Good message
String get displayMessage => _message;
final AuthService _authenticationService = locator<AuthService>();

  int _messageType;
   int get displayMessageType => _messageType;
   String bankName, accountNo, accountName; 
  
  proceed({String amounts}){
     if(amounts.isEmpty){
 showMessage(msg: 'All fields must be fill', type: 0);
     }else{
        
     }
  }

  showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
} 
  

  initialized()
     async{
      setBusy(true);
      bankName =  _authenticationService.currentUser.bankName;
      accountNo =  _authenticationService.currentUser.accountNumber;
      accountName = _authenticationService.currentUser.accountName;
      setBusy(false);
  }
  }