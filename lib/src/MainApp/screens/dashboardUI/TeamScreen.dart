import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/DashboardViewModel.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/widget/uihelper.dart';

class TeamScreen extends StatefulWidget {
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
   final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
       onModelReady: (model) => model.showData(),
      builder: (context, model, child) =>Scaffold(
        //backgroundColor: AppColor.primary,
        body: Column(children: <Widget>[
          card1(),
          Row(
          children: <Widget>[
         GestureDetector(child: reportsCard(model),
         onTap: (){
           model.reportScreen(); //TODO MOVE TO REPORT SCREEN
         },),
         Expanded(child: staffCard(model),)
        ],
      )
        ],),
        floatingActionButton: FloatingActionButton.extended(
          label: Row(children: <Widget>[
               Icon(Icons.add, size: 30,),
                Text('ADD STAFF',
                         style: AppTextStyle.rampatBoldStyle(AppColor.white, 14)),
             ],), 
             onPressed: () { 
              _navigationService.navigateTo(staffRoute, );
             },
            ),
    )
    );
  }

  
  card1(){
return Container(
    height: MediaQuery.of(context).size.height / 3.5,
    ///width: MediaQuery.of(context).size.width,
    child: Card(
      elevation: 10,
     color: Colors.white,
     child: Stack(
       children: <Widget>[
         Positioned(child:   Text('You need to complete set up before', 
             style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             top: 10, bottom: 20, left: 110,),

             Positioned(child:   Text('you can begin your employee ', 
             style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             top: 29, bottom: 20, left: 125,),

             Positioned(child:   Text('management.',  
             style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             top: 50,  right: 70, ),

         Positioned(child:   Text('Tap here to set up your company info ', 
             style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             top: 150, bottom: 20, left: 90,),
         Row(
       
       children: <Widget>[
        Padding(
         padding: const EdgeInsets.only(left:8.0, top: 8.0, bottom: 10.0, right: 8.0),
         child: CircularPercentIndicator(
                  radius: 100.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 10.0,
                  percent: 0.8,
                  center: new Text(
                    "0%",
                        style: AppTextStyle.rampatBoldStyle(AppColor.black, 32),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: AppColor.white,
                  progressColor: AppColor.secondary,
                ),
       ),
     
     ],)

       ],
     )
    ),
  );

  }

//Report
reportsCard(DashboardViewModel model){
  return Container(
    height: MediaQuery.of(context).size.height / 3.5,
    width: MediaQuery.of(context).size.height / 3.8,
    child: Card(
      elevation: 10,
     color: Colors.white,
     child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Icon(Icons.calendar_today),
            horizontalSpaceSmall,
            Text('Reports', style: AppTextStyle.rampatBoldStyle(AppColor.secondary, AppFontSizes.large2_1),)
          ]),
        ),
        horizontalSpaceLarge,

        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 9.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 6.9,
            child: Center(child: Text((model.report == null ? '0' : model.report), 
            style: AppTextStyle.rampatBoldStyle(AppColor.secondary, 48),)),),
        ),
         Expanded(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             Text('You have ', style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             Text((model.report == null ? '0' : model.report), style: AppTextStyle.rampatBoldStyle(AppColor.darkGrey, AppFontSizes.medium),),
             Text(' reports', style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),)
           ]),
         ),
     ],)

    ),
  );

}

//
staffCard(DashboardViewModel model){
  return Container(
    height: MediaQuery.of(context).size.height / 3.5,
    width: MediaQuery.of(context).size.width / 3,
    child: Card(
      elevation: 10,
     color: Colors.white,
     child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Icon(Icons.people),
            horizontalSpaceSmall,
            Text('Staff', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.large2_1),)
          ]),
        ),
        horizontalSpaceLarge,

        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 9.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 6.9,
            child: Center(child: Text((model.staff == null ? '0' : model.staff),
            style: AppTextStyle.rampatBoldStyle(AppColor.primary, 48),)),),
        ),
         Expanded(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             Text('You have ', style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             Text((model.staff == null ? '0' : model.staff), style: AppTextStyle.rampatBoldStyle(AppColor.darkGrey, AppFontSizes.medium),),
             Text(' staff', style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),)
           ]),
         ),
     ],)

    ),
  );

}

}