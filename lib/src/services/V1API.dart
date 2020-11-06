import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualtribe/src/MainApp/model/OrganisationDetailsModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/ListofUsersModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/AuthenticationModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/MembersModel.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/UsersActivities.dart';
import 'package:virtualtribe/src/MainApp/model/V1Model/WeeklyTimesheetModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppText.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/V1BaseAPI.dart';
import 'package:virtualtribe/src/services/baseUrl.dart';
import 'package:http/http.dart' as http;

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class V1API implements V1BaseAPI {
  final BaseUrl _url = locator<BaseUrl>();
  static int httpDuration = 15;

  @override
  Future<AuthenticationModel> authenticateUser({String username, String password})async {
     Map<String, String> sendData = new HashMap();
     Map<String, String> header = new HashMap();

    header['App-Token'] = AppText.v1Token;
    sendData['email'] = username;
    sendData['password'] = password;

    try {
      var response = await http.post(_url.authLink, headers: header, body: sendData)
      .timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);

      print('Server response. ${convert.toString()}');

     if(convert == null){
       
     return null;
     
     }else{

      if(response.statusCode == 200){
     AuthenticationModel authenticationModel = AuthenticationModel.fromJson(convert);
        return authenticationModel;

      }else{
        print('Am beeing executed');
        AuthenticationModel authenticationModel = AuthenticationModel.fromJson(convert);
        return authenticationModel;
      } 
     }
    } on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response
      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

     }on FormatException catch (e) {
      //Exception if there's invalid Http
      throw Failure(e.toString()); //AppText.badrequest
    }
  }

  @override
  Future<ListofUsersModel> getUsersList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
      String usertoken = prefs.getString(Constants.userToken);
     int uid = prefs.getInt(Constants.userId);
     Map<String, String> header = new HashMap();

    header['App-Token'] = AppText.v1Token;
     header['Auth-Token'] = usertoken; //"dzObVVDLsGAkZzKtROX2d11T9Dc6UkUwz9IH-d4gBgs";


    try {
      var response = await http.get('${_url.userDetailsLink}$uid', headers: header,)
      .timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);

     print('Server response. ${convert.toString()}');

     if(convert == null){
       
     return null;
     
     }else{

      if(response.statusCode == 200){
     ListofUsersModel listofUsersModel = ListofUsersModel.fromJson(convert);
        return listofUsersModel;

      }else{
       ListofUsersModel listofUsersModel = ListofUsersModel.fromJson(convert);
        return listofUsersModel;
      } 
      
     }
    } on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response

      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

    }on FormatException catch (e) {
      //Exception if there's invalid Http
       print(e.toString());
      throw Failure(e.toString()); //AppText.badrequest
    }
  }

  @override
  Future<WeeklyTimesheetModel> getWeeklySheet({String year, String months, String day})async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
      String usertoken = prefs.getString(Constants.userToken);
     Map<String, String> header = new HashMap();

    header['App-Token'] = AppText.v1Token;
    header['Auth-Token'] = usertoken; //"dzObVVDLsGAkZzKtROX2d11T9Dc6UkUwz9IH-d4gBgs";
    try {
      var response = await http.get('${_url.weeklyLink}$year-$months-$day', headers: header,)
      .timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);

     print('Server response. ${convert.toString()}');

     if(convert == null){
       
     return null;
     
     }else{

      if(response.statusCode == 200){
     WeeklyTimesheetModel weeklyTimesheetModel = WeeklyTimesheetModel.fromJson(convert);
        return weeklyTimesheetModel;

      }else{
       WeeklyTimesheetModel weeklyTimesheetModel = WeeklyTimesheetModel.fromJson(convert);
        return weeklyTimesheetModel;
      } 
      
     }
    } on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response

      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

    }on FormatException catch (e){
      //Exception if there's invalid Http
      print(e.toString());
      throw Failure(e.toString()); //AppText.badrequest
    }
  }

  @override
  Future<UsersActivities> getUserActivities({String startTime, String stopTime})
  async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
      String usertoken = prefs.getString(Constants.userToken);
     Map<String, String> header = new HashMap();

    header['App-Token'] = AppText.v1Token;
    header['Auth-Token'] = usertoken; //

    try {
      var response = await http.get('${_url.activities}$startTime&stop_time=$stopTime', headers: header,)
      .timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);

     print('Server response. ${convert.toString()}');

     if(convert == null){
       
     return null;
     
     }else{

      if(response.statusCode == 200){
     UsersActivities usersActivities = UsersActivities.fromJson(convert);
        return usersActivities;

      }else{
      UsersActivities usersActivities = UsersActivities.fromJson(convert);
        return usersActivities;
      } 
      
     }
    } on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response

      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

    }on FormatException catch (e){
      //Exception if there's invalid Http
      print(e.toString());
      throw Failure(e.toString()); //AppText.badrequest
    }
  }

  @override
  Future<OrganisationDetailsModel> getOrganisationDetails() 
  async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
      String usertoken = prefs.getString(Constants.userToken);
     Map<String, String> header = new HashMap();

    header['App-Token'] = AppText.v1Token;
    header['Auth-Token'] = usertoken; //
    header['offset'] = "0"; //

    try {
      var response = await http.get('${_url.getOrganisationDetailsLink}?offset=0', headers: header,)
      .timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);

    // print('Server response. ${convert.toString()}');

     if(convert == null){
       
     return null;
     
     }else{

      if(response.statusCode == 200){
     OrganisationDetailsModel organisationDetailsModel = OrganisationDetailsModel.fromJson(convert);
        return organisationDetailsModel;

      }else{
      OrganisationDetailsModel organisationDetailsModel = OrganisationDetailsModel.fromJson(convert);
        return organisationDetailsModel;
      } 
      
     }
    } on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response

      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

    }on FormatException catch (e){
      //Exception if there's invalid Http
      print(e.toString());
      throw Failure(e.toString()); //AppText.badrequest
    }
  }

  @override
  Future<MembersModel> getAllMembers()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
      String usertoken = prefs.getString(Constants.userToken);
       String organisationID = prefs.getString(Constants.organizationID);
     Map<String, String> header = new HashMap();

    header['App-Token'] = 'dMNhKxu2WbWJ0c3pwetL4AsfCTGnAL2cEq-7P04DtIg';//AppText.v1Token;
    header['Auth-Token'] = 'VHhWPrdqJEmPY6Lafm_nxHJvdnPCo4FbtctQIrFzcN0';//usertoken; //
    header['id'] = '288406';//organisationID; //

    try {
      var response = await http.get('${_url.getAllMembersLink}/$organisationID/members', headers: header,)
      .timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);
     if(convert == null){
       
     return null;
     
     }else{
      if(response.statusCode == 200){
     MembersModel membersModel = MembersModel.fromJson(convert);
        return membersModel;

      }else{
      MembersModel membersModel = MembersModel.fromJson(convert);
        return membersModel;
      } 
      
     }
    } on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response

      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

    }on FormatException catch (e){
      //Exception if there's invalid Http
      print(e.toString());
      throw Failure(e.toString()); //AppText.badrequest
    }
  }
}