import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/Version1/viewmodel/V1LisfofStaffModel.dart';
import 'package:virtualtribe/src/locator.dart';

class V1LisfofStaffUI extends StatefulWidget {
  @override
  _V1LisfofStaffUIState createState() => _V1LisfofStaffUIState();
}

class _V1LisfofStaffUIState extends State<V1LisfofStaffUI> {
  final CustomFunction _customFuntion = locator<CustomFunction>();

 static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;
  
  @override
  Widget build(BuildContext context) {
     return ViewModelBuilder<V1LisfofStaffModel>.reactive(
      viewModelBuilder: () => V1LisfofStaffModel(),
      onModelReady: (model) => model.initialise(
      ),
      builder: (context, model, child) =>
     Scaffold(
        appBar: AppBar(
           backgroundColor: AppColor.primary,
        title: Text('My Staffs', 
        style: AppTextStyle.rampatStyle(AppColor.white, AppFontSizes.large)),
        ),
        backgroundColor: AppColor.white,
        body: (model.isBusy ?  Center(child:_customFuntion.loaderPrimay())
        : _getBodyWidget(model)),
    ));
  }

  Widget _getBodyWidget(V1LisfofStaffModel model) {
    return Column(
      children: [
        SizedBox(
            height: 10,
        ),
          _customFuntion.errorUimessage(
            errorMessage: model.displayMessage, 
             type: model.displayMessageType,
             context: context),
        Expanded(
                  child: Container(
      child: HorizontalDataTable(
          leftHandSideColumnWidth: 100,
          rightHandSideColumnWidth: 800,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Text(model.getAllMembers[index].id.toString()),//model.getUserTimesheetDetails.id.toString()
                  width: 200,
                  height: 52,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                );
              },
          rightSideItemBuilder: (BuildContext context, int index) {
            var activityTime = model.getAllMembers[index].lastActivity.trim();
           
    return Row(
      children: <Widget>[

        Container(
            child: Text(model.getAllMembers[index].name.toString() == null ? " " :model.getAllMembers[index].name.toString()),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),

           Container(
            child: Text(model.getAllMembers[index].email.toString() == null ? " " : model.getAllMembers[index].email.toString()),
            width: 200,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),

          Container(
            child: Text(model.getAllMembers[index].membershipStatus.toString() == null ? " " : model.getAllMembers[index].membershipStatus.toString()),
            width: 200,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          
          Container(
            child:  Text(model.getAllMembers[index].lastActivity.toString() == null ? " " : activityTime.toString()),
            width: 200,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
      ],
    );
  },
          itemCount: model.getAllMembers.length,
          rowSeparatorWidget: const Divider(
            color: Colors.black54,
            height: 1.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
          rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
      width:  MediaQuery
            .of(context)
            .size
            .width,
      height: MediaQuery
            .of(context)
            .size
            .height,
    ),
        )
      ],
    );
  }
   
  List<Widget> _getTitleWidget() {
    return [
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget(
            'ID' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
            200),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          setState(() {

          });
        },
      ),
          _getTitleItemWidget('Name', 100),
          _getTitleItemWidget('Email', 200),
          _getTitleItemWidget('Membership Status', 200),
          _getTitleItemWidget('Last Activity', 200),
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
   
}