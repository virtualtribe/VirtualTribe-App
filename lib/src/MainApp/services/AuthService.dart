import 'package:firebase_auth/firebase_auth.dart';
import 'package:virtualtribe/src/MainApp/model/CompanyModel.dart';
import 'package:virtualtribe/src/MainApp/model/UserModel.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/locator.dart';

class AuthService{
 final FirebaseAuth _auth = FirebaseAuth.instance;
var customlogic = locator<CustomFunction>(); //Creating an injection of CustomFunction class

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;
  var companydata;

  CompanyModel _currentCompany;
  CompanyModel get currentCompany => _currentCompany;

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
      // if(_currentUser.companyID != null){ //Populate current company details
      // // _currentCompany = await _firestoreService.getCompanyDetails(_currentUser.companyID);
      //  //companydata = await _firestoreService.getCompanyDetails(_currentUser.companyID);
      // }
     // return _currentUser != null;
    }
  }

//checking if id existin
  Future<bool> checkIfIDExist()async{
     var user = await _firebaseAuth.currentUser();
    String id = user.uid;
    var data = await _firestoreService.checkUserID(userID: id);
    if(data != null){
       await _populateCurrentUser(user); // Populate the user information
       return true;
    }else{
     return false;
    }
  }


  //Sign Out
   Future signOut()async{
     try{
        return await _auth.signOut();

     }catch(e){
    print('******signInAnonymous ERROR ${e.toString()}');
    return null;
     }
   }

   //SigIn Anonymously,
  Future signInAnonymous () async{
    try{
       AuthResult _result =  await _auth.signInAnonymously();
       FirebaseUser _user = _result.user;
       return _populateCurrentUser(_user);
    }catch(e){ //If there's an Error 
    print('******signInAnonymous ERROR ${e.toString()}');
    return null;
    }
  }

}