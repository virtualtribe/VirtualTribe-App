import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/AddStaffByAdminModel.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/locator.dart';

class StaffViewModel extends BaseViewModel{
   final AuthService _authenticationService = locator<AuthService>();
   String _message;
   String get getmessage =>_message;
   List staffSupervisor;
    int errorType;
     final FirestoreService _firestoreService = locator<FirestoreService>();

  showData(){
 staffSupervisor =_authenticationService.companydata['supervisors'];
 print(staffSupervisor.length);
// report = _authenticationService.currentCompany.reportNo.toString();
// staff =  _authenticationService.currentCompany.staffNo.toString();
 }


 Future<void> proceed({String mail, String supervisor, String role, String management}) async {
  
   
    final Email email = Email(
      body: 'You are hereby invited to join your company team on VirtualTribe App. \n Your supervisor name: $supervisor. \n\n\n Click on this link to download and login on the App\n https://play.google.com/store/apps/details?id=com.virtualtribe.virtualwork',
      subject:'Invitation from Virtualtribe App',
      recipients: [mail]
    );

    String platformResponse;
    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Invitation sent';
    
 try{
             setBusy(true);
     var result =  await _firestoreService.createStaffbyAdmin(AddStaffByAdminModel(
        email: mail,
        supervisor: supervisor,
        role: role,
        management: management));
        print('MANAGMENT $management');
      
      if(result is String){
          setBusy(false);
        showMessage(v: 'Could not create Staff', errorT: 0);
      }else{
          setBusy(false);
      }
            setBusy(false);

 }catch(e){
   showMessage(v: e.toString(), errorT: 0);
    setBusy(false);
 }
      showMessage(v: platformResponse, errorT: 1);
      print(platformResponse);
    } catch (error) {
      platformResponse = error.toString();
       showMessage(v: platformResponse, errorT: 0);
    }
  }

 showMessage({String v, int errorT}){
     _message  = v;
     errorType = errorT;
    notifyListeners();
  }

}