import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/Version1/viewmodel/V1ActivitiesViewModel.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/locator.dart';


class V1ActivitiesScreen extends StatefulWidget {
  V1ActivitiesScreen({Key key}) : super(key: key);

  @override
  _V1ActivitiesScreenState createState() => _V1ActivitiesScreenState();
}

class _V1ActivitiesScreenState extends State<V1ActivitiesScreen> {
    final CustomFunction _customFuntion = locator<CustomFunction>();

 static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;
   String year, month, day;
   final formatAmounts = new NumberFormat("#,##0.00", "en_US");
   String formattedYearSTART,formattedMonthSTART, formattedDaySTART;
   String formattedYearSTOP,formattedMonthSTOP, formattedDaySTOP;
   TextEditingController startDateofTimesheet, endDateofTimesheet;
   //2020-09-03"
   //"2020-09-05"
  
      @override
  void initState() {
   // user.initData(data);
     todaysDate();
     super.initState();
     startDateofTimesheet = TextEditingController();
     endDateofTimesheet = TextEditingController();
  }
   
  @override
  Widget build(BuildContext context) {
     return ViewModelBuilder<V1ActivitiesViewModel>.reactive(
      viewModelBuilder: () => V1ActivitiesViewModel(),
      // onModelReady: (model) => model.initialise(
      //   startT: startDateofTimesheet.text,
      //   stopT: endDateofTimesheet.text
      // ),
      builder: (context, model, child) =>
     Scaffold(
        appBar: AppBar(
           backgroundColor: AppColor.primary,
        title: Text('My Activities', 
        style: AppTextStyle.rampatStyle(AppColor.white, AppFontSizes.large)),
        ),
        backgroundColor: AppColor.white,
        body: _getBodyWidget(model),
    ));
  }
  
  Widget _getBodyWidget(V1ActivitiesViewModel model) {
    return Column(
      children: [
        SizedBox(
            height: 10,
        ),

         Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
                              Column(
                                children: [
                                  Text("Start Date", style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(
                                  height: 5,
                                      ),
                                            Container(
                               width: MediaQuery.of(context).size.width/2.5,
                                child: TextFormField(
                              controller: startDateofTimesheet,
                              style: TextStyle(fontWeight: FontWeight.bold,),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration:  InputDecoration(
                                enabledBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: new BorderSide(color: AppColor.primary,
                                ),
                            ),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: new BorderSide(color: AppColor.primary
                          ),

                      ),
                        
                        
                      ),   
                      onTap: (){
                          DatePicker.showDatePicker(
                         context,
                        showTitleActions: true,
                        onChanged: (date) {
                          String v = '${date.year}-${date.month}-${date.day}'; //2020-09-03
                           setStartDate(value: v);
                         
                        }, onConfirm: (date) {
                         String v = '${date.year}-${date.month}-${date.day}'; //2020-09-03
                         setStartDate(value: v);

                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                        ), ),

                                ],
                              ),
                   
                       Column(
                         children: [
                            Text("Stop Date", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                                  height: 5,
                                      ),
                            Container(
                                 height: 70,
                                 width: 150,
                                child: TextFormField(
                              controller: endDateofTimesheet,
                              style: TextStyle(fontWeight: FontWeight.bold,),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration:  InputDecoration(
                                enabledBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: new BorderSide(color: AppColor.primary,
                                ),
                            ),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: new BorderSide(color: AppColor.primary
                          ),
                      ),
                      
                        
                      ),   
                      onTap: (){
                          DatePicker.showDatePicker(
                         context,
                        showTitleActions: true,
                        onChanged: (date) {

                          String v = '${date.year}-${date.month}-${date.day}'; 
                          setStopDate(value: v);

                        }, onConfirm: (date) {

                       String v = '${date.year}-${date.month}-${date.day}'; 
                          setStopDate(value: v);

                       },  currentTime: DateTime.now(), 
                       locale: LocaleType.en);
                      },
                        ), ), 
                        
                         ],
                       )
                            ]),
        
          _customFuntion.errorUimessage(
            errorMessage: model.displayMessage, 
             type: model.displayMessageType,
             context: context),

                          GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                          child: Container(
                            height: 40,
                            child: Material(
                              child: Center(
                                child: (model.isBusy ?  _customFuntion.loader()
                                : Text('Fetch Data',
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                  ),))
                              ),
                              color:  AppColor.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  side: BorderSide(color: AppColor.primary)
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                         // print('YEAR => $year MonthData => $day DayData => $month');
                          model.initialise(
                            startT: startDateofTimesheet.text,
                            stopT: endDateofTimesheet.text
                          );
                        },
                      ),
  
        Expanded(
                  child: Container(
      child: HorizontalDataTable(
          leftHandSideColumnWidth: 100,
          rightHandSideColumnWidth: 800,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Text(model.getUserActivities[index].id.toString()),//model.getUserTimesheetDetails.id.toString()
                  width: 200,
                  height: 52,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                );
              },
          rightSideItemBuilder: (BuildContext context, int index) {
            var time_slot = model.getUserActivities[index].timeSlot.trim();
            var starts_at = model.getUserActivities[index].startsAt.trim();
           
    return Row(
      children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(child: Text(model.getUserActivities[index].timeSlot.toString == null ? " " : time_slot.toString())) 
              ],
            ),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),

          Container(
            child:  Text(model.getUserActivities[index].startsAt.toString == null ? " " : starts_at.toString()),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),

          Container(
            child: Text(model.getUserActivities[index].projectId.toString == null ? " " : model.getUserActivities[index].projectId.toString()),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),

           Container(
            child: Text(model.getUserActivities[index].taskId.toString == null ? " " : model.getUserActivities[index].taskId.toString()),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),

          Container(
            child: Text(model.getUserActivities[index].keyboard.toString == null ? " " : model.getUserActivities[index].keyboard.toString()),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),

          Expanded(
                    child: Container(
              child: Text(model.getUserActivities[index].mouse.toString == null ? " " : model.getUserActivities[index].mouse.toString()),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),

          Expanded(
                    child: Container(
              child: Text(model.getUserActivities[index].overall.toString == null ? " " : model.getUserActivities[index].overall.toString()),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),

          Expanded(
                    child: Container(
              child: Text(model.getUserActivities[index].tracked.toString == null ? " " : model.getUserActivities[index].tracked.toString()),
              width: 200,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),

          Expanded(
                    child: Container(
              child: (model.getUserActivities[index].paid ?
              Row(
                children: <Widget>[
                  Icon(
                       Icons.done_all,
                      color: Colors.green),
                      SizedBox(width: 5),
                  Text('Payed')
                ],
              ) :  Row(
                children: <Widget>[
                  Icon(
                       Icons.error_outline,
                      color: Colors.red),
                      SizedBox(width: 5),
                  Text('Not Payed')
                ],
              )),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
          
     
      ],
    );
  },
          itemCount: model.getUserActivities.length,
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
      _getTitleItemWidget('Time Slot', 100),
      _getTitleItemWidget('Starts At', 100),
       _getTitleItemWidget('Project Id', 100),
       _getTitleItemWidget('Task id', 100),
        Expanded(
          child: _getTitleItemWidget('Keyboard', 100)),
         Expanded(child: _getTitleItemWidget('Mouse', 100)),
          Expanded(child: _getTitleItemWidget('Overall', 100)), 
           Expanded(child: _getTitleItemWidget('Tracked', 100)),
           Expanded(child: _getTitleItemWidget('Paid', 100)),
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
   
  todaysDate() {
    var now = new DateTime.now();
    var yearFormatter = new DateFormat('yyyy'); //--dd
    var monthFormatter = new DateFormat('MM');
    var dayFormatter = new DateFormat('dd');
     formattedYearSTART = yearFormatter.format(now);
      formattedMonthSTART = monthFormatter.format(now);
       formattedDaySTART = dayFormatter.format(now);
  }

  setStartDate({String value}){
    setState(() {
startDateofTimesheet.text = value;
    });
  }

   setStopDate({String value}){
    setState(() {
endDateofTimesheet.text = value;
    });
  }
}