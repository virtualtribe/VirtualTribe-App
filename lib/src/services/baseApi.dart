//***** THIS IS THE BASE API WHERER ALL API IS CALL FOR DATA MODEL */
import 'package:virtualtribe/src/MainApp/model/BankInfoModel.dart';
import 'package:virtualtribe/src/MainApp/model/FetchBankModel.dart';
import 'package:virtualtribe/src/MainApp/model/LoginUserModel.dart';
import 'package:virtualtribe/src/MainApp/model/OrganisationDetailsModel.dart';
import 'package:virtualtribe/src/MainApp/model/TimeSheetModel.dart';
import 'package:virtualtribe/src/MainApp/model/OrganizationMemberModel.dart';

abstract class BaseApi{
  Future<LoginUserModel> loginUser({String username, String password});
   Future<OrganisationDetailsModel> getOrganisationDetails({int startID, int limit});
  Future<FetchBankModel> getBanks();
  Future<BankInfoModel> getBankInfo({String accountNumber, String bankCode});
   Future<TimesheetsModel> getTimeSheet({String pageStartId, String pageLimit, 
   String dateStart, String dateStop, String status, String organizationId});

    Future<OrganizationMemberModel> getOrganisationMembers({String pageStartId, String pageLimit, String includeRemoved,
    String includeProjects, String organizationId});
     
}