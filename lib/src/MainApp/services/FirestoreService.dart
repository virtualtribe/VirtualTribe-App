import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtualtribe/src/MainApp/model/AddStaffByAdminModel.dart';
import 'package:virtualtribe/src/MainApp/model/CompanyModel.dart';
import 'package:virtualtribe/src/MainApp/model/UserModel.dart';

class FirestoreService{
final CollectionReference _userCollectionReference = Firestore.instance.collection('Users');
final CollectionReference _companyCollectionRef = Firestore.instance.collection('Companies'); 
final CollectionReference _staffsCollectionRef = Firestore.instance.collection('InvitationStaffs'); 


//This will add user details, after successful Registration
Future  createUser(UserModel userDetails)async{
try{
   await _userCollectionReference.document(userDetails.id).setData(
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
}