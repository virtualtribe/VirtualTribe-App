import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:virtualtribe/src/MainApp/services/AuthService.dart';
import 'package:virtualtribe/src/locator.dart';

class ReportTableData extends StatefulWidget {
  @override
  _ReportTableDataState createState() => _ReportTableDataState();
}
final AuthService _authenticationService = locator<AuthService>();

class _ReportTableDataState extends State<ReportTableData> {
 
 List<dynamic> data = _authenticationService.companydata['Reports'];

static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    user.initData(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBodyWidget(),
    );
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
            'Name' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
            200),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          setState(() {

          });
        },
      ),
      _getTitleItemWidget('Attendance', 100),
      _getTitleItemWidget('Hours', 100),
      _getTitleItemWidget('Amount Due', 100),
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
      width: 200,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Text(user.userInfo[index].attendance)
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].hours),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(user.userInfo[index].amounts),
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

  void initData(List<dynamic> data) {
 data.forEach((element) {
   //print('Amounts >>>>> ${element['attendance']}');
   if(data.length == data.length){
       _userInfo.add(UserInfo(
          name: "${element['name']}", attendance:'${element['attendance']}', 
          hours: '${element['hours']}', amounts: '${element['amounts']}'));
   }else{
     
   }
     
 });
 
  }

  List<UserInfo> get userInfo => _userInfo;

  set userInfo(List<UserInfo> value) {
    _userInfo = value;
  }

}

class UserInfo {
  String name;
  String attendance;
  String hours;
  String amounts;

  UserInfo({this.name, this.attendance, this.hours, this.amounts}
      );
}
