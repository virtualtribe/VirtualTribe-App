import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/UsersActivities.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/V1API.dart';

class V1ActivitiesViewModel extends BaseViewModel{
final NavigationService _navigationService = locator<NavigationService>();
String _message;
 int _messageType;
 int get displayMessageType => _messageType;
  String get displayMessage => _message;
    final V1API _v1api = locator<V1API>();
    List<Activities> _activitiesList = List<Activities >();
 List<Activities> get getUserActivities => _activitiesList;


initialise({String startT, stopT}){

  setBusy(true);
  _v1api.getUserActivities(
    startTime: startT, stopTime: stopT, 
  ).then((value)async{
                    if(value.activities == null){
                        setBusy(false);
                    showMessage(msg: value.error, type: 0);
                    print(value.error);
                         
                    }else{
                       if(value.activities.length == 0){ 
                        //Opps! Failed.
                         showMessage(msg: value.error, type: 0);
                         print(value.error);
                            setBusy(false);
                         _activitiesList = null;
               }else{
               
                 print('Organization Length => ${value.activities.length}');
for (var index = 0; index < value.activities.length; index++) {

  // print('Response Date => ${value.organizations[0].users[0].dates[index].date}');
  //   print('Response Duration => ${value.organizations[0].users[0].dates[index].duration}');

                      _activitiesList.add(
                      Activities(
                        id: value.activities[index].id,
                        keyboard: value.activities[index].keyboard,
                        mouse: value.activities[index].mouse,
                        overall: value.activities[index].overall,
                        paid: value.activities[index].paid,
                        projectId: value.activities[index].projectId,
                        startsAt: value.activities[index].startsAt,
                        taskId: value.activities[index].taskId,
                        timeSlot: value.activities[index].timeSlot,
                        tracked: value.activities[index].tracked,
                        userId: value.activities[index].userId,)   
              );
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