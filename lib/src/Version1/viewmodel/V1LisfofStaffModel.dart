import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/ListofUsersModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/MembersModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/UsersActivities.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/V1API.dart';


class V1LisfofStaffModel extends BaseViewModel{
final NavigationService _navigationService = locator<NavigationService>();
String _message;
 int _messageType;
 int get displayMessageType => _messageType;
  String get displayMessage => _message;
    final V1API _v1api = locator<V1API>();
    List<Users> _membersList = List<Users>();
 List<Users> get getAllMembers => _membersList;


initialise({String startT, stopT}){

  setBusy(true);
  _v1api.getUsersList().then((value)async{
  if(value.users == null){
                        setBusy(false);
                    showMessage(msg: value.error, type: 0);
                    print(value.error);
                         
   }else{
              if(value.users.length == 0){ 
                //Opps! Failed.
                showMessage(msg: value.error, type: 0);
                print(value.error);
                  setBusy(false);
                _membersList = null;

               }else{
                 print('Organization Length => ${value.users.length}');
for (var index = 0; index < value.users.length; index++) {

  // print('Response Date => ${value.organizations[0].users[0].dates[index].date}');
  //   print('Response Duration => ${value.organizations[0].users[0].dates[index].duration}');
                      _membersList.add(
                          Users(
                        email: value.users[index].email,
                        id: value.users[index].id,
                        lastActivity: value.users[index].lastActivity,
                        name: value.users[index].name,
                      ));
  } 
  setBusy(false);

   } 
  
  }
    
  }).catchError((e)async{
                      showMessage(msg: e.toString(), type: 0);
                      setBusy(false);
 });
}

showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
} 

}