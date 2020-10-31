
//***** THIS IS THE BASE API WHERER ALL API IS CALL FOR DATA MODEL */
import 'package:virtualtribe/src/MainApp/model/OrganisationDetailsModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/AuthenticationModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/ListofUsersModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/MembersModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/UsersActivities.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/WeeklyTimesheetModel.dart';

abstract class V1BaseAPI{
  Future<AuthenticationModel> authenticateUser({String username, String password});
   Future<ListofUsersModel> getUsersList();
   Future<WeeklyTimesheetModel> getWeeklySheet({String year, String months, String day});
   Future<UsersActivities> getUserActivities({String startTime, String stopTime});
   Future<OrganisationDetailsModel> getOrganisationDetails();
   Future<MembersModel> getAllMembers();
}