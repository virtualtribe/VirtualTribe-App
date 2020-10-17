import 'package:flutter/material.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/NavDrawer.dart';
import 'package:virtualtribe/src/StaffApp/StaffDasboard/StaffDashoardViewModel.dart';
import 'package:virtualtribe/src/StaffApp/StaffDasboard/StaffMETAB.dart';
import 'package:virtualtribe/src/StaffApp/StaffDasboard/StaffTEAMTAB.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';

class StaffDasbhoard extends StatefulWidget {
  @override
  _StaffDasbhoardState createState() => _StaffDasbhoardState();
}

class _StaffDasbhoardState extends State<StaffDasbhoard> {
  final NavigationService _navigationService = locator<NavigationService>();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StaffDashoardViewModel>.reactive(
      viewModelBuilder: () => StaffDashoardViewModel(),
      onModelReady: (model) => model.showData(),
      builder: (context, model, child) => DefaultTabController(
        length: 2,
       child: Scaffold(
        
         key: _drawerKey,
         drawer: NavDrawer(),
          appBar: PreferredSize(
               preferredSize: Size.fromHeight(100.0),  
               child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                leading: GestureDetector(child: Icon(Icons.menu, size: 30, color: Colors.grey,),
                onTap:(){
                  if (_drawerKey.currentState.isEndDrawerOpen) {
              _drawerKey.currentState.openDrawer();
            } else {
              _drawerKey.currentState.openEndDrawer();
            }
                }),
                actions: <Widget>[
                  GestureDetector(
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.settings, size: 30, color:  Colors.grey,),
                    ),
                    onTap: (){
              _navigationService.navigateTo(settingRoute);
                    },
                  )
                ],
                title:  Text(('Olajire Abdullah'), 
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
                       child: StaffMETAB(),
                     ),
                     )
                   ],)
                 ),
Padding(
                   padding: const EdgeInsets.only(top: 1, left: 5.0, right: 5.0),
                   child: Column(children: <Widget>[
                     Expanded(child: Padding(
                       padding: const EdgeInsets.only(top: 5.0, ),
                       child: StaffTEAMTAB()
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