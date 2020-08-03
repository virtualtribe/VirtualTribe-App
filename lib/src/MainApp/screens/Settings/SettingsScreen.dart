import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/Settings/CompanyScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/Settings/PersonnalScreen.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/DashboardViewModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
       builder: (context, model, child) => DefaultTabController(
        length: 2,
                child: Scaffold(
           appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),  
                        child: AppBar(
                   backgroundColor: Colors.white,
                    elevation: 0,
                    centerTitle: true,
                    leading: GestureDetector(child: Icon(Icons.arrow_back, size: 30, color: Colors.grey,), 
                    onTap: (){
                      Navigator.pop(context);
                    },),
               title:  Text('Settings', 
                    style:  TextStyle(
                  color: AppColor.black,
                  fontSize: AppFontSizes.large,
                  fontWeight: FontWeight.bold
                ),
              ),
              actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(FontAwesome.logout, size: 30, color:  Colors.red,),
                      )
                    ],
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
                            child: Text("PERSONAL", style: TextStyle(fontSize: 13),),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("COMPANY",  style: TextStyle(fontSize: 13),),
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
                       child: PersonnalScreen(),
                     ),
                     )
                   ],)
                 ),

Padding(
                   padding: const EdgeInsets.only(top: 1, left: 5.0, right: 5.0),
                   child: Column(children: <Widget>[
                     Expanded(child: Padding(
                       padding: const EdgeInsets.only(top: 5.0, ),
                       child: CompanyScreen()
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