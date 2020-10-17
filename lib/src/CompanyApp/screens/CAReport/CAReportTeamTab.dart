import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/CompanyApp/screens/CAReport/CAReportSViewModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/widget/ReportTableData.dart';

class CAReportTeamTab extends StatefulWidget {
  @override
  _CAReportTeamTabState createState() => _CAReportTeamTabState();
}

class _CAReportTeamTabState extends State<CAReportTeamTab> {
   @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<CAReportSViewModel>.reactive(
      viewModelBuilder: () => CAReportSViewModel(),
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
                            child: Text("PENDING", style: TextStyle(fontSize: 13),),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("APPROVED",  style: TextStyle(fontSize: 13),),
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
                       child: PendingTab(),
                     ),
                     )
                   ],)
                 ),

Padding(padding: const EdgeInsets.only(top: 1, left: 5.0, right: 5.0),
                   child: Column(children: <Widget>[
                     Expanded(child: Padding(
                       padding: const EdgeInsets.only(top: 5.0, ),
                       child: ApprovedTab()
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

class PendingTab extends StatefulWidget {
  @override
  _PendingTabState createState() => _PendingTabState();
}

class _PendingTabState extends State<PendingTab> {
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

class ApprovedTab extends StatefulWidget {
  @override
  _ApprovedTabState createState() => _ApprovedTabState();
}

class _ApprovedTabState extends State<ApprovedTab> {
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