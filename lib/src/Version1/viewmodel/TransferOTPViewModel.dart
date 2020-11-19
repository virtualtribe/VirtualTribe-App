import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/V1API.dart';

class TransferOTPViewModel extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();
  String _message;
  int _messageType;
  int get displayMessageType => _messageType;
  String get displayMessage => _message;
  final V1API _v1api = locator<V1API>();
  final AuthService _authenticationService = locator<AuthService>();
final FirestoreService _firestoreService = locator<FirestoreService>();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
bool loader = false;

  finalTransfer({String otpCode, String transferCode, String amounts}){

    setBusy(true);
    _v1api.verifyTransferOTP(
      otp: otpCode,
      transferCode: transferCode
    ).then((value){
      if(!value.status){
        setBusy(false);
        showMessage(msg: value.message, type: 0);

      }else{
        showMessage(msg: value.message, type: 1);
        increaseRecipentBalance(amounts);
      }
    });
  }

  showMessage({String msg, int type}){
    _message = msg;
    _messageType = type;
    notifyListeners();
  }

  //Increase user accountBalance
increaseRecipentBalance(String amounts)async{
   int currentBalance = int.parse(_authenticationService.currentUser.walletBalance);
    int  enteredAmounts = int.parse(amounts);
    var newTotalBalance =  currentBalance - enteredAmounts;

    try{
    var result = await _firestoreService.addAndDeductMoney(
      staffFirebaseID: _authenticationService.currentUser.id,
      newAmounts: newTotalBalance.toString()
    );

    if(result is String){
      setBusy(false);
      showMessage(msg: 'Could not create Profile', type: 0);

    }else{
      setBusy(false);
      showMessage(msg: 'Successfully Withdraw', type: 1);
    }
    setBusy(false);

  }catch(e){
      showMessage(msg: e.toString(), type: 0);
      setBusy(false);
  }
}
}