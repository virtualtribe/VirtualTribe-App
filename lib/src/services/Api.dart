import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualtribe/src/MainApp/model/BankInfoModel.dart';
import 'package:virtualtribe/src/MainApp/model/FetchBankModel.dart';
import 'package:virtualtribe/src/MainApp/model/LoginUserModel.dart';
import 'package:virtualtribe/src/MainApp/model/OrganisationDetailsModel.dart';
import 'package:virtualtribe/src/MainApp/model/OrganizationMemberModel.dart';
import 'package:virtualtribe/src/MainApp/model/TimeSheetModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppText.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/services/baseApi.dart';
import 'package:virtualtribe/src/services/baseUrl.dart';

//*********** NOTE */
//***** IF STATUS IS TRUE => SUCCESS FOR THE API */
//*** ELSE FAILED FROM THE API */

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class API implements BaseApi {
  final BaseUrl _url = locator<BaseUrl>();
  static int httpDuration = 15; //show data within 10, else display an exception.. Am setting it to 10 sec because THIS IS NIGERIA


//******* LOGIN API */
@override
  Future<LoginUserModel> loginUser({String username, String  password}) async{
    Map<String, String> sendData = new HashMap();
     Map<String, String> header = new HashMap();

    // sendData['email_address'] = username;
    // sendData['password'] = password;
    header['Authorization'] = AppText.token;

    try {
      var response = await http.get(_url.loginLink, headers: header)
      .timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);
      //print('**********Data from server $convert');

     if(convert == null){
     return null;

     }else{

      if(response.statusCode == 200){
     LoginUserModel loginUserModel = LoginUserModel.fromJson(convert);
        return loginUserModel;

      }else{
         LoginUserModel loginUserModel = LoginUserModel.fromJson(convert);
        return loginUserModel;
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

    }on FormatException {
      //Exception if there's invalid Http
      throw Failure(AppText.badrequest);
    }
  }

  @override
  Future<OrganisationDetailsModel> getOrganisationDetails({int startID, int limit}) async{
    
     Map<String, String> header = new HashMap();
    header['Authorization'] = AppText.token;

    try {
      var response = await http.get('${_url.organizationDetails}$startID&$limit', 
      headers: header).timeout(Duration(seconds: httpDuration));

      var convert = json.decode(response.body);

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

    }on FormatException {
      //Exception if there's invalid Http
      throw Failure(AppText.badrequest);
    }
  }

  @override
  Future<FetchBankModel> getBanks() async{
   Map<String, String> header = new HashMap();
    header['Authorization'] = "Bearer sk_test_eb7fc42b689ea056344cf62f06155c09531cf2a7";

    try {
      var response = await http.get(_url.fetchBank, 
      headers: header).timeout(Duration(seconds: httpDuration));

      var convert = json.decode(response.body);

     if(convert == null){
     return null;

     }else{

      if(response.statusCode == 200){
     FetchBankModel fetchBankModel = FetchBankModel.fromJson(convert);
        return fetchBankModel;

      }else{
        FetchBankModel fetchBankModel = FetchBankModel.fromJson(convert);
        return fetchBankModel;
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

    }on FormatException {
      //Exception if there's invalid Http
      throw Failure(AppText.badrequest);
    }
  }

  @override
  Future<BankInfoModel> getBankInfo({String accountNumber, String bankCode})async{
     Map<String, String> header = new HashMap();
    header['Authorization'] = "Bearer sk_test_eb7fc42b689ea056344cf62f06155c09531cf2a7";

    try {
      var response = await http.get("https://api.paystack.co/bank/resolve?account_number=$accountNumber&bank_code=$bankCode", 
      headers: header).timeout(Duration(seconds: httpDuration));

      var convert = json.decode(response.body);

     if(convert == null){
     return null;

     }else{

      if(response.statusCode == 200){
     BankInfoModel bankInfoModel = BankInfoModel.fromJson(convert);
        return bankInfoModel;

      }else{
        BankInfoModel bankInfoModel = BankInfoModel.fromJson(convert);
        return bankInfoModel;
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

    }on FormatException {
      //Exception if there's invalid Http
      throw Failure(AppText.badrequest);
    }
  }

  @override
  Future<TimesheetsModel> getTimeSheet({String pageStartId, String pageLimit, String dateStart, 
  String dateStop, String status, String organizationId})async{

      Map<String, String> header = new HashMap();
      header['Authorization'] = AppText.token;
//"${_url.fetchTimeSheet}$organizationId/timesheets?page_start_id=$pageStartId&page_limit=$pageLimit&date[start]=$dateStart&date[stop]=$dateStop&status=$status"
    try {
      var response = await http.get("https://api.hubstaff.com/v2/organizations/281773/timesheets?page_start_id=1&page_limit=1&status=approved", 
      headers: header).timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);

     if(convert == null){
     return null;

     }else{

      if(response.statusCode == 200){
     TimesheetsModel timesheetsModel = TimesheetsModel.fromJson(convert);
        return timesheetsModel;

      }else{
       TimesheetsModel timesheetsModel = TimesheetsModel.fromJson(convert);
        return timesheetsModel;
      } 
      
     }
    }on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response

      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

    }on FormatException {
      //Exception if there's invalid Http
      throw Failure(AppText.badrequest);
    }
  }

  @override
  Future<OrganizationMemberModel> getOrganisationMembers({String pageStartId, String pageLimit, 
  String includeRemoved, String includeProjects, String organizationId})async{

    Map<String, String> header = new HashMap();
      header['Authorization'] = AppText.token;
//"${_url.fetchTimeSheet}$organizationId/timesheets?page_start_id=$pageStartId&page_limit=$pageLimit&date[start]=$dateStart&date[stop]=$dateStop&status=$status"
  
    try {
      var response = await http.get("https://api.hubstaff.com/v2/organizations/281773/members?page_start_id=1&page_limit=10&include_removed=true&include_projects=true", 
      headers: header).timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);

     if(convert == null){
     return null;

     }else{

      if(response.statusCode == 200){
     OrganizationMemberModel organizationMemberModel = OrganizationMemberModel.fromJson(convert);
        return organizationMemberModel;

      }else{
       OrganizationMemberModel organizationMemberModel = OrganizationMemberModel.fromJson(convert);
        return organizationMemberModel;
      } 
     }
    }on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response

      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

    }on FormatException {
      //Exception if there's invalid Http
      throw Failure(AppText.badrequest);
    }
  }

}
