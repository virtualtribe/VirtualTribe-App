import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/UsersActivities.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/WalletHistoryModel.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/V1API.dart';

class MyTransactionViewModel extends BaseViewModel{
final NavigationService _navigationService = locator<NavigationService>();
String _message;
 int _messageType;
 int get displayMessageType => _messageType;
  String get displayMessage => _message;
  List<WalletHistoryModel> _history = List<WalletHistoryModel>();
   List<WalletHistoryModel> get getHistory => _history;
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 final FirestoreService _firestoreService = locator<FirestoreService>();


initialise()async{

  setBusy(true);
      var user = await _firebaseAuth.currentUser();
   // String id = user.uid;
    String id = 'E0j0Mu0E7M8wSQ1icTpu';
    List<DocumentSnapshot>  data = await _firestoreService.getMyTransactionsWallect(userID: id);

    if(data != null){
      if(_history.isNotEmpty){
      print('******************Am not Empty Jare************8');
      _history.clear();
    }
     for(int i = 0; data.length > i; i++){
       print('Value ${data[i].documentID}');
      // print(data[i].documentID);
      var result  = await transactionData(transacID: data[i].documentID);
      if(result != null){
        setBusy(false);
            //Data found
            _history.add(result);
      }else{
         setBusy(false);
        //NO Data found
        showMessage(msg: 'No Transaction found', type: 0);
      setBusy(false);
      }
     }
      // print('Data is not null');
     
    }else{
     // print('Data is fucking Null');
     showMessage(msg: 'No Transaction found', type: 0);
      setBusy(false);
    }
}

showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
} 
  transactionData({String transacID})async{
     setBusy(true);
    var user = await _firebaseAuth.currentUser();
    String id = 'E0j0Mu0E7M8wSQ1icTpu'; //user.uid;
    DocumentSnapshot  result = await _firestoreService.lisofTransactionData(userID: id, 
    transactID: transacID);

  if(result.data != null){
     return WalletHistoryModel.fromData(result.data);
  }else{
    return null;
  }
}
}