import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtualtribe/src/MainApp/model/AddStaffByAdminModel.dart';
import 'package:virtualtribe/src/MainApp/model/CompanyModel.dart';
import 'package:virtualtribe/src/MainApp/model/UserModel.dart';

class FirestoreService{
final CollectionReference _userCollectionReference = Firestore.instance.collection('Users');

final CollectionReference _companyCollectionRef = Firestore.instance.collection('Companies'); 
final CollectionReference _staffsCollectionRef = Firestore.instance.collection('InvitationStaffs'); 
final CollectionReference _wallectTransactionsCollectionRef = Firestore.instance.collection('WalletTransaction'); 

//This will add user details, after successful Registration
Future  createUser(UserModel userDetails)async{
try{
   await _userCollectionReference.document(userDetails.id).setData(
      userDetails.toJson());
  
  }catch(e){
    return e.message; 
  }
  
}

  Future  updateUserDetails(UserModel userDetails)async{
    try{
      await _userCollectionReference.document(userDetails.id).updateData(
          userDetails.toJson());

    }catch(e){
      return e.message;
    }
  }

  //Get User Data
Future getUser(String uid)async{
  try{

   var userInfo = await _userCollectionReference.document(uid).get();
   return UserModel.fromData(userInfo.data);

  }catch(e){
    return e.message; 
  }
}

Future<List<DocumentSnapshot>>  numberofUsers()async{
  try{

   var userInfo = await _userCollectionReference.getDocuments();
   return userInfo.documents;

  }catch(e){
    return e.message; 
  }
  }

Stream<DocumentSnapshot> getUserLiveData(String uid){
  try{

   return  _userCollectionReference.document(uid).snapshots();
   //return userInfo;
  //   userInfo.listen((event) {
  //   return UserModel.fromData(event.data);
  //  });

  }catch(e){
    return e.message; 
  }
}

//RJQKRueveRSAR68IIQedJY8CX0w2
//Check if User ID is register on firestore by getting uer document ID.

Future checkUserID({String userID})async{
  var document = await _userCollectionReference.document(userID).get(); //userID
  return document.data;
}


Future createCompany(CompanyModel companyModel)async{
try{
   await _companyCollectionRef.document(companyModel.comapanyName).setData(
      companyModel.toJson());
  
  }catch(e){
    return e.message; 
  }
}

Future getCompanyDetails(String companyID)async{
  try{
   var value = await _companyCollectionRef.document(companyID).get();
   //print(value.data['staffs']);
   return value.data; //CompanyModel.fromData(value.data);
  }catch(e){
    return e.message; 
  }
}

Future  createStaffbyAdmin(AddStaffByAdminModel adminModel)async{
try{
   await _staffsCollectionRef.document(adminModel.email).setData(
      adminModel.toJson());
  
  }catch(e){
    return e.message; 
  }
}


Future<List<DocumentSnapshot>> getMyTransactionsWallect({String userID})async{
  try{
    var query = await _wallectTransactionsCollectionRef.document(userID) //
    .collection('Transactions').getDocuments(); //getDocuments()
    if(query.documents.isEmpty){
print('AM fucking Null => []');
 return null;
    }else{
 print('I have data asshole => ${query.documents}');
 return query.documents;
    }
   
  
  }catch(e){
    return e.message;
  }
}

Future<DocumentSnapshot> lisofTransactionData({String userID, String transactID})async{
  try{
    var query = await _wallectTransactionsCollectionRef.document(userID)
    .collection('Transactions').document(transactID);
    return query.get();

  }catch(e){
    return e.message;
  }
}

Future<List<DocumentSnapshot>> searchUserByHubstaffID({String userId})async{
    try{
      var query = await _userCollectionReference.where('hubstaffID', isEqualTo: userId).getDocuments();
      return query.documents;

    }catch(e){
      return e.message;
    }
  }

  //SEND MONEY BY UPDATING USER WALLET BALANCE.
  Future addAndDeductMoney({String staffFirebaseID, String newAmounts})async{
    Map<String ,Object> newdata = new Map<String ,Object>();
    newdata['walletBalance'] = newAmounts;
    try{
      await _userCollectionReference.document(staffFirebaseID).updateData(
          newdata
      );

    }catch(e){
      return e.message;
    }
  }
}