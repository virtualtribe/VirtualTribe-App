import 'package:flutter/material.dart';
import 'package:virtualtribe/src/MainApp/model/OrganisationDetailsModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//******** FOR DEVELOPER LOGICAL FUNCTION CREATED HIMSELF, */
class CustomFunction{

saveSmallData({String email, int userid,
 String name, String lastActivity})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString(Constants.email, email);
       prefs.setInt( Constants.userId,  userid);
       prefs.setString(Constants.name,  name);
       prefs.setString(Constants.activityTime,  lastActivity);
  }
  
  saveEmailANDToken({String email, int userid, String token,
 String name, String lastActivity})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString(Constants.email, email);
       prefs.setInt( Constants.userId,  userid);
       prefs.setString( Constants.userToken,  token);
       prefs.setString(Constants.name,  name);
       prefs.setString(Constants.activityTime,  lastActivity);
  }
  
   entredEmail(String providedEMail)async{
    //Temporary saving email when login with email, SO that i can retrieve it and signi with this email and dynamic link
    SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString(Constants.enteredEmail, providedEMail);
  }

  saveOrganizationDetails(Organizations organizations)async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString(Constants.organizationID, organizations.id.toString());
        prefs.setString(Constants.organizationName, organizations.name);
            prefs.setString(Constants.organizationStatus, organizations.status);
            print('Organisation Name ${organizations.name}');
  }
    
//EMAIL VALIDATOR
String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
}


errorUimessage({String errorMessage, int type, BuildContext context}){
  //TYPE
  //1 Good Message
  //2 Error
   return  (errorMessage == null ? SizedBox.shrink() : Center(
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         (type == 1 ? Icon(Icons.check_circle, color: Colors.green,): Icon(Icons.error, color: Colors.red,)),
         SizedBox(width: 10,),
         Expanded(child: Text(errorMessage,
        textAlign: TextAlign.justify,
     overflow: TextOverflow.ellipsis,
         maxLines: 5,
           style: AppTextStyle.normalStyle((type == 1 ? Colors.green : Colors.red),)
           ),)
         

       ],),
   ));
  }


loader(){
  return Center(child: CircularProgressIndicator(strokeWidth: 5,  
  valueColor: new AlwaysStoppedAnimation<Color>(AppColor.white),
  ));
}

loaderPrimay(){
  return Center(child: CircularProgressIndicator(strokeWidth: 5,  
  valueColor: new AlwaysStoppedAnimation<Color>(AppColor.primary),
  ));
}

//USER ROLE
String roleValue(int value){
  switch(value){

    case 1: //Staff
  return 'Staff';
    break;

    case 2: //Supervisor
return 'Supervisor';
    break;

    case 3: //Admin
  return 'Admin';
    break;

    default:
    return 'No value found';
  }
}
//EMPOLYE MANAGEMENT
String employeeManagement(int value){
  switch(value){

    case 1: //Staff
  return 'Attendance';
    break;

    case 2: //Supervisor
return 'Time-Sheet';
    break;

    default:
    return 'No value found';
  }
}

  errorUimessage2({String errorMessage, int type, BuildContext context}){
   return  (errorMessage == null ? SizedBox.shrink() : Center(
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         (type == 1 ? Icon(Icons.check_circle, color: Colors.green,): Icon(Icons.error, color: Colors.red,)),
         SizedBox(width: 10,),
         Expanded(child: Text(errorMessage,
        textAlign: TextAlign.justify,
     overflow: TextOverflow.ellipsis,
         maxLines: 5,
           style: AppTextStyle.normalStyle((type == 1 ? Colors.green : Colors.red),)
           ),)
         

       ],),
   ));
  }

 
}

