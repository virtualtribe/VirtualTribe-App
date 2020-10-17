import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/DashboardViewModel.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/MainApp/widget/ReportTableData.dart';
import 'package:virtualtribe/src/StaffApp/StaffDasboard/StaffDashoardViewModel.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/widget/uihelper.dart';

class StaffTEAMTAB extends StatefulWidget {
  @override
  _StaffTEAMTABState createState() => _StaffTEAMTABState();
}

class _StaffTEAMTABState extends State<StaffTEAMTAB> {
   final NavigationService _navigationService = locator<NavigationService>();

   @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<StaffDashoardViewModel>.reactive(
      viewModelBuilder: () => StaffDashoardViewModel(),
      builder: (context, model, child) =>DefaultTabController(
        length: 2,
              child: Scaffold(
          appBar: PreferredSize(
               preferredSize: Size.fromHeight(40.0),  
               child: AppBar(
                backgroundColor: Colors.white,
                bottom: TabBar(
                    unselectedLabelColor: AppColor.darkGrey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColor.primary,
                    indicatorWeight: 1.0,
                    indicator: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColor.white, AppColor.white]),
                        borderRadius: BorderRadius.circular(1),
                        color: AppColor.secondary),
                        indicatorColor: AppColor.primaryDark,
                    tabs: [
                      Container(
                        height: 30,
                        child: Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("STAFF INFO", style: TextStyle(fontSize: 13),),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("REPORTS",  style: TextStyle(fontSize: 13),),
                          ),
                        ),
                      ),
                    ]),
           
           
              ),
            ),
            body: TabBarView(children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 1, ),
                   child: Column(children: <Widget>[
                     Expanded(child: Padding(
                       padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                       child: StaffInfo(),
                     ),
                     )
                   ],)
                 ),

Padding(padding: const EdgeInsets.only(top: 1, left: 5.0, right: 5.0),
                   child: Column(children: <Widget>[
                     Expanded(child: Padding(
                       padding: const EdgeInsets.only(top: 5.0, ),
                       child: StafReports()
                     ),
                     )
                   ],)
                 ),
              ]),
        ),
      )
  );
  
  }
}

class StaffInfo extends StatefulWidget {
  @override
  _StaffInfoState createState() => _StaffInfoState();
}

class _StaffInfoState extends State<StaffInfo> {
  final CustomFunction _developerFunction = locator<CustomFunction>();
   int _value = 0; int _value1 = 0;
   List<String> staffSupervisor;
    String _selectedSepervisors;
   int role, management;
   TextEditingController emailController;


   setRole(int v){
    setState(() {
      role = v;
      _value = v;
    });
  }

   setManagement(int v){
    setState(() {
      management = v;
      _value1 = v;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: <Widget>[
         SizedBox(height: 5,),
        Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Email Address *', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                ],),
              ),
        Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.grey,
                   child: TextField(
                     controller: emailController,
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            hintText: ' aderonke@virtualtribe.ng',
                             border: InputBorder.none,
                            hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small)
                          ),
                              ),
                 ),
               ),

               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Full Name', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                ],),
              ),
                Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.grey,
                   child: TextField(
                     controller: emailController,
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            hintText: ' Olajire Abdullah',
                             border: InputBorder.none,
                            hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small)
                          ),
                              ),
                 ),
               ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Mobile Number', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                ],),
              ),
              Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.grey,
                   child: TextField(
                     controller: emailController,
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            hintText: ' +2348654566',
                             border: InputBorder.none,
                            hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small)
                          ),
                              ),
                 ),
               ),
              
        Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                
                Text('Role', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                ],),
              ),

                  Row(
  children: <Widget>[
      Radio(
          value: 1,
          groupValue: _value,
          onChanged: (value){
              setRole(value);
          },
          activeColor: Color(0xFF6200EE),
          
        ),
      Text(
              'Staff',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),
SizedBox(width: 10.0,),
      Radio(
          value: 2,
          groupValue: _value,
          onChanged: (value){
              setRole(value);
          },
          activeColor: Color(0xFF6200EE),
          
        ),
      Text(
              'Supervisor',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),
            SizedBox(width: 10.0,),
      Radio(
          value: 3,
          groupValue: _value,
          onChanged: (value){
              setRole(value);
          },
          activeColor: Color(0xFF6200EE), ),
      Text(
              'Admin',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),

  ],
),

               Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: FindDropdown(
                      items: ['1', '2'],
                      label: "Supervisor Name",
                      labelStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, 12),
                      onChanged:(value){
                        _selectedSepervisors = value;
                      },
                      selectedItem: 'staff@virtualwork.ng',
                      validate: (item) {
                        if (item == null)
                          return "Required field";
                        else if (item == "Adobe")
                          return "Invalid item";
                        else
                          return null;
                      },
                    ),
                  ),

Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Employee Management', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                ],),
              ),

              Row(
  children: <Widget>[
      Radio(
          value: 1,
          groupValue: _value1,
          onChanged: (value){
            setManagement(value);
          },
          activeColor: Color(0xFF6200EE),
        ),
      Text(
              'Attendance Based',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),
SizedBox(width: 10.0,),
      Radio(
          value: 2,
          groupValue: _value1,
          onChanged: (value){
            setManagement(value);
          },
          activeColor: Color(0xFF6200EE),
        ),
      Text(
              'Time Sheet Based',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),
            SizedBox(width: 10.0,),
  ],
),
  SizedBox(height: 10,),
         
              //_developerFunction.errorUimessage(errorMessage: model.getmessage, type: model.errorType, context: context),
       Expanded(
                child: Align(
            alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                      child: Container(
                        height: 40,
                        child: Material(
                          child: Center(
                            child: Text('REMOVE STAFF'.toUpperCase(),
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          color:  AppColor.secondary,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              side: BorderSide(color: AppColor.primary)
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      
                    },),
         ),
       )
      ],
    );
  }
}

class StafReports extends StatefulWidget {
  @override
  _StafReportsState createState() => _StafReportsState();
}

class _StafReportsState extends State<StafReports> {
  @override
  Widget build(BuildContext context) {
         return Column(
      children: <Widget>[
        Expanded(
          child: ReportTableData(
      ),
    )
      ],
    );

  }
}