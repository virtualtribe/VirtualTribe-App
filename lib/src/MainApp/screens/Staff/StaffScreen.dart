import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/Staff/MeTabScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/Staff/StaffViewModel.dart';
import 'package:virtualtribe/src/MainApp/screens/Staff/TeamTabScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/MeScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/TeamScreen.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';


class StaffScreen extends StatefulWidget {
  @override
  _StaffScreenState createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  Widget build(BuildContext context) {
      return ViewModelBuilder<StaffViewModel>.reactive(
      viewModelBuilder: () => StaffViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: 2,
              child: Scaffold(
          appBar: PreferredSize(
               preferredSize: Size.fromHeight(100.0),  
               child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, size: 30, color: Colors.grey,)),
                title:  Text('Add Staff', 
                style:  TextStyle(
              color: AppColor.black,
              fontSize: AppFontSizes.large,
              fontWeight: FontWeight.bold
            )
          ),
                bottom: TabBar(
                    unselectedLabelColor: AppColor.darkGrey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColor.primary,
                    indicatorWeight: 1.0,
                    indicator: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColor.primaryLight, AppColor.primaryLight]),
                        borderRadius: BorderRadius.circular(1),
                        color: AppColor.secondary),
                        indicatorColor: AppColor.primaryDark,
                    tabs: [
                      Container(
                        height: 30,
                        child: Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("ME", style: TextStyle(fontSize: 13),),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("TEAM",  style: TextStyle(fontSize: 13),),
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
                       child: MeTabScreen(),
                     ),
                     )
                   ],)
                 ),

Padding(
                   padding: const EdgeInsets.only(top: 1, left: 5.0, right: 5.0),
                   child: Column(children: <Widget>[
                   
                     Expanded(child: Padding(
                       padding: const EdgeInsets.only(top: 5.0, ),
                       child: TeamTabScreen()
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