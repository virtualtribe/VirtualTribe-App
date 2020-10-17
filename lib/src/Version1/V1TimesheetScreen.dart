import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/Version1/viewmodel/V1TimeSheetViewModel.dart';
import 'package:virtualtribe/src/locator.dart';

class V1TimesheetScreen extends StatefulWidget {
  @override
  _V1TimesheetScreenState createState() => _V1TimesheetScreenState();
}

class _V1TimesheetScreenState extends State<V1TimesheetScreen> {
    final CustomFunction _customFuntion = locator<CustomFunction>();
    TextEditingController dateofTimesheet;
    String year, month, day;

static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;
   final formatAmounts = new NumberFormat("#,##0.00", "en_US");
   String formattedYear,formattedMonth, formattedDay;

  @override
  void initState() {
   // user.initData(data);
   todaysDate();
    super.initState();
     dateofTimesheet = TextEditingController(text: "$formattedDay-$formattedMonth-$formattedYear");
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<V1TimeSheetViewModel>.reactive(
      viewModelBuilder: () => V1TimeSheetViewModel(),
      onModelReady: (model) => model.initialise(
        dayData: formattedDay.toString(),
        monthsData: formattedMonth.toString(),
        yearData: formattedYear.toString()
      ),
      builder: (context, model, child) =>
      Scaffold(
        appBar: AppBar(
           backgroundColor: AppColor.primary,
        title: Text('My Timesheet', 
        style: AppTextStyle.rampatStyle(AppColor.white, AppFontSizes.large)),
        ),
        backgroundColor: AppColor.white,
        body: _getBodyWidget(model),
    ));
  }

  Widget _getBodyWidget(V1TimeSheetViewModel model) {
    return Column(
children: [
  Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                         color: AppColor.grey,
                         child: TextFormField(
                              controller: dateofTimesheet,
                               keyboardType: TextInputType.number,
                              style: TextStyle(fontWeight: FontWeight.bold,),
                            
                              decoration:  InputDecoration(
                                  hintText: 'Select date',
                                   border: InputBorder.none,
                                  hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                ),   
                      onTap: (){
                          DatePicker.showDatePicker(
                         context,
                        showTitleActions: true,
                        onChanged: (date) {
                          String v = '${date.day}-${date.month}-${date.year}';
                          setCheckOutDate(value: v, dayV: date.day.toString(), monthV: date.month.toString(), 
                         yearV: date.year.toString());

                        }, onConfirm: (date) {
                           String v = '${date.day}-${date.month}-${date.year}';
                          setCheckOutDate(value: v, dayV: date.day.toString(), monthV: date.month.toString(), 
                         yearV: date.year.toString());
                         
                        }, currentTime: DateTime.now(), 
                        locale: LocaleType.en);
                      },
                        ),
                       ),
                   ),
                    SizedBox(
                    height: 20,
                  ),
                    _customFuntion.errorUimessage(errorMessage:
                   model.displayMessage, type: model.displayMessageType,
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
                            dayData: day,
                            yearData: year,
                            monthsData: month
                          );
                        },
                      ),
       
  Expanded(
      child: Container(
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 100,
          rightHandSideColumnWidth: 600,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: (BuildContext context, int index) {
            //print('IDS => ${model.getUserTimesheet[index].duration}');
         //  print(model.getUserTimesheet[index].date.toString.runtimeType);
           
                return Container(
                  child: Text(model.getUserTimesheetDetails.id.toString()),//model.getUserTimesheetDetails.id.toString()
                  width: 200,
                  height: 52,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                );
              },
          rightSideItemBuilder: (BuildContext context, int index) {
            var value = model.getUserTimesheet[index].date.trim();
            var amounts = (model.getUserTimesheet[index].duration) * 500;
            print(amounts);
      return Row(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text(model.getUserTimesheet[index].date.toString == null ? " " : value.toString()) 
              ],
            ),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Text(model.getUserTimesheet[index].duration.toString() == null ? " " : model.getUserTimesheet[index].duration.toString()),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child:  Text(model.getUserTimesheet[index].duration.toString() == null ? "" : 'N' + formatAmounts.format(double.parse(amounts.toString())),),
            width: 200,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          
        ],
      );
    },
          itemCount: model.getUserTimesheet.length,
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
      _getTitleItemWidget('Date', 100),
      _getTitleItemWidget('Duration', 100),
       _getTitleItemWidget('Amounts', 100),
      //  _getTitleItemWidget('Payment', 100),
      //   _getTitleItemWidget('Status', 100),
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

 setCheckOutDate({String value, String yearV, String monthV, String dayV}){
    setState(() {
dateofTimesheet.text = value;
 year = yearV; 
 month = monthV; day = dayV;
    });
  }

  todaysDate() {
    var now = new DateTime.now();
    var yearFormatter = new DateFormat('yyyy'); //--dd
    var monthFormatter = new DateFormat('MM');
    var dayFormatter = new DateFormat('dd');
     formattedYear = yearFormatter.format(now);
      formattedMonth = monthFormatter.format(now);
       formattedDay = dayFormatter.format(now);
  }
}