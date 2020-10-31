import 'package:stacked/stacked.dart';

class WithdrawViewModel extends BaseViewModel{
String _message; //for displaying Error message or other Good message
  String get displayMessage => _message;

  int _messageType;
   int get displayMessageType => _messageType;
  
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
  }