import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/TimeSheetModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/WeeklyTimesheetModel.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/Api.dart';
import 'package:virtualtribe/src/services/V1API.dart';

class V1TimeSheetViewModel extends BaseViewModel{
final NavigationService _navigationService = locator<NavigationService>();
final API _api = locator<API>();
 String _message;
 int _messageType;
 int get displayMessageType => _messageType;
  String get displayMessage => _message;
 List<Dates> _userTimesheet = List<Dates >();
 List<Dates> get getUserTimesheet => _userTimesheet;
 String organsationName;

Users _userTimesheetDetails = Users ();
Users get getUserTimesheetDetails => _userTimesheetDetails;
final V1API _v1api = locator<V1API>();


initialise({String yearData, String monthsData, String dayData}){
showMessage(msg: null);
print('YEAR => $yearData MonthData => $monthsData DayData => $dayData');
  setBusy(true);
  _v1api.getWeeklySheet(
    year: yearData, months: monthsData, day: dayData
  ).then((value)async{
                    if(value.organizations == null){
                        setBusy(false);
                    showMessage(msg: value.error, type: 0);
                    print(value.error);
                         
                    }else{
                       if(value.organizations.length == 0){ 
                        //Opps! Failed.
                         showMessage(msg: value.error, type: 0);
                         print(value.error);

                            setBusy(false);
                         _userTimesheet = null;
               }else{
                 organsationName = value.organizations[0].name;
                 _userTimesheetDetails.id = value.organizations[0].users[0].id;
                  _userTimesheetDetails.name = value.organizations[0].users[0].name;
                     _userTimesheetDetails.duration = value.organizations[0].users[0].duration;


                 print('Organization Length => ${value.organizations[0].users.length}');
for (var index = 0; index < value.organizations[0].users[0].dates.length; index++) {

  // print('Response Date => ${value.organizations[0].users[0].dates[index].date}');
  //   print('Response Duration => ${value.organizations[0].users[0].dates[index].duration}');

                      _userTimesheet.add(
                      Dates(
                        date: value.organizations[0].users[0].dates[index].date,
                        duration: value.organizations[0].users[0].dates[index].duration,
                      )   
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