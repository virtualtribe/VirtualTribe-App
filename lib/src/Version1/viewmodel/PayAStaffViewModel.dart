import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/UserModel.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/locator.dart';

class PayAStaffViewModel extends BaseViewModel{
String _message; //for displaying Error message or other Good message
String get displayMessage => _message;
final AuthService _authenticationService = locator<AuthService>();
final FirestoreService _firestoreService = locator<FirestoreService>();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
String currentStaffFirebaseID, currentPreviousWalletBalance;
bool loader = false;

  int _messageType;
   int get displayMessageType => _messageType;

  

sendMoney({String amounts})async{
  showMessage(msg: null);
  if(amounts.isEmpty){
 showMessage(msg: 'Amounts is Empty', type: 0);
  }else{

    int currentBalance = int.parse(currentPreviousWalletBalance);
    int  enteredAmounts = int.parse(amounts);
    var newTotalBalance = currentBalance + enteredAmounts;

    try{
    var result = await _firestoreService.sendMoney(
      staffFirebaseID: currentStaffFirebaseID,
      newAmounts: newTotalBalance.toString()
    );

    if(result is String){
      setLoader(false);
      showMessage(msg: 'Could not create Profile', type: 0);

    }else{
      setLoader(false);
      showMessage(msg: 'Money Successfully send', type: 1);
    }
    setLoader(false);

  }catch(e){
      showMessage(msg: e.toString(), type: 0);
  setLoader(false);
  }

  }
}

searchByID(String hubstaffID)async{
  showMessage(msg: null);
  var result = await _firestoreService.searchUserByHubstaffID(userId: hubstaffID);
  if(result.isEmpty){
    print('Am Empty..........$result.......');
    setBusy(false);
    showMessage(msg: 'This User has not Register on our Custom Server', type: 0);
  }else{
    setBusy(false);
    currentStaffFirebaseID = result[0].data['id'];
    currentPreviousWalletBalance = result[0].data['walletBalance'];
    // print("Current User Firebase ID => $currentStaffFirebaseID");
    // print("Current User Wallet Balance => $currentPreviousWalletBalance");
  }
}

 showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
}

setLoader(bool value){
  loader = value;
  notifyListeners();
}
}