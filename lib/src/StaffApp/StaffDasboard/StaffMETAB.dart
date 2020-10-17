import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/dashboardUI/MeViewModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/widget/uihelper.dart';
import 'package:virtualtribe/src/StaffApp/StaffDasboard/StaffDashoardViewModel.dart';

class StaffMETAB extends StatefulWidget {
  @override
  _StaffMETABState createState() => _StaffMETABState();
}

class _StaffMETABState extends State<StaffMETAB> {
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<StaffDashoardViewModel>.reactive(
      viewModelBuilder: () => StaffDashoardViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Row(
          children: <Widget>[
          card1(),
         Expanded(child: card2(),)
        ],
      )
    )
  );
  }



card1(){
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
            child: Center(child: Text('0', 
            style: AppTextStyle.rampatBoldStyle(AppColor.secondary, 48),)),),
        ),
         Expanded(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             Text('You have ', style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             Text('0', style: AppTextStyle.rampatBoldStyle(AppColor.darkGrey, AppFontSizes.medium),),
             Text(' reports', style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),)
           ]),
         ),
     ],)

    ),
  );
}

card2(){
  return Container(
    height: MediaQuery.of(context).size.height / 3.5,
    width: MediaQuery.of(context).size.height / 3.8,
    child: Card(
      elevation: 10,
     color: Colors.white,
     child: Column(children: <Widget>[
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
                  backgroundColor: AppColor.primaryLight,
                  progressColor: AppColor.primary,
                ),
       ),
               Expanded(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             Center(child: Text('Tap here to set up your \n profile',  textAlign: TextAlign.center,
             style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),)),
           ]),
         ),
 
     ],)

    ),
  );
}

}