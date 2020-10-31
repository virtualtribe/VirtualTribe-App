import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/Version1/viewmodel/MyTransactionViewModel.dart';
import 'package:virtualtribe/src/locator.dart';

class MyTransactionScreens extends StatefulWidget {
  @override
  _MyTransactionScreensState createState() => _MyTransactionScreensState();
}

class _MyTransactionScreensState extends State<MyTransactionScreens> {
  
   final CustomFunction _customFuntion = locator<CustomFunction>();

 static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;
   static const int sortStatus = 1;
   String year, month, day;
   final formatAmounts = new NumberFormat("#,##0.00", "en_US");
   String formattedYearSTART,formattedMonthSTART, formattedDaySTART;
   String formattedYearSTOP,formattedMonthSTOP, formattedDaySTOP;
   TextEditingController startDateofTimesheet, endDateofTimesheet;
  
      @override
  void initState() {
   user.initData(30);
     super.initState();
     startDateofTimesheet = TextEditingController();
     endDateofTimesheet = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<MyTransactionViewModel>.reactive(
      viewModelBuilder: () => MyTransactionViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) =>
      Scaffold(
        appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('My Wallet Transactions', 
        style: AppTextStyle.rampatStyle(AppColor.white, AppFontSizes.large)),
        ),
        backgroundColor: AppColor.white,
      //   body: (model.isBusy ? 
      //  Center(child:  _customFuntion.loader())
      //   : uiWidget(model)
      //   ),
      body: _getBodyWidget(),
    ));
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: user.userInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
      height: MediaQuery
          .of(context)
          .size
          .height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget(
            'ID' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
            100),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending);
          setState(() {

          });
        },
      ),
      _getTitleItemWidget('Amounts', 200),
      _getTitleItemWidget('Date', 100),
      _getTitleItemWidget('Time', 100),
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('Status' +
            (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''), 100),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          user.sortStatus(isAscending);
          setState(() {

          });
        },
      ),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(user.userInfo[index].name),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        
        Container(
          child: Text(user.userInfo[index].phone),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].registerDate),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].terminationDate),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                  user.userInfo[index].status
                      ? Icons.error : Icons.done_all,
                  color: user.userInfo[index].status ? Colors.red 
                  : Colors.green),
              Text(user.userInfo[index].status ? 'Failed' : 'Successful')
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

User user = User();

class User {
  List<UserInfo> _userInfo = List<UserInfo>();

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      _userInfo.add(UserInfo(
          "$i", i % 3 == 0, 'N5,000', '01-3-2019', '12:30pm'));
    }
  }

  List<UserInfo> get userInfo => _userInfo;

  set userInfo(List<UserInfo> value) {
    _userInfo = value;
  }

  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    _userInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('User_', ''));
      int bId = int.tryParse(b.name.replaceFirst('User_', ''));
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    _userInfo.sort((a, b) {
      if (a.status == b.status) {
        int aId = int.tryParse(a.name.replaceFirst('User_', ''));
        int bId = int.tryParse(b.name.replaceFirst('User_', ''));
        return (aId - bId);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class UserInfo {
  String name;
  bool status;
  String phone;
  String registerDate;
  String terminationDate;

  UserInfo(this.name, this.status, this.phone, this.registerDate,
      this.terminationDate);
}