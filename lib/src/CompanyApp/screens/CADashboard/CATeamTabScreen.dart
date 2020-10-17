import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/CompanyApp/screens/CADashboard/CAppDashboardScreenViewModel.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/widget/uihelper.dart';

class CATeamTabScreen extends StatefulWidget {
  @override
  _CATeamTabScreenState createState() => _CATeamTabScreenState();
}

class _CATeamTabScreenState extends State<CATeamTabScreen> {
 final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<CAppDashboardScreenViewModel>.reactive(
      viewModelBuilder: () => CAppDashboardScreenViewModel(),
      builder: (context, model, child) =>Scaffold(
        //backgroundColor: AppColor.primary,
        body: Column(children: <Widget>[
          Row(
          children: <Widget>[
          GestureDetector(child: cards(type: 'Reports', icon: Icons.calendar_today, number: '0', text1: 'You have', text2: ' 0', text3: ' reports'
          , color: AppColor.secondary),
          onTap: (){
            _navigationService.navigateTo(cAReportScreen);
          },
          ),

         Expanded(child: cards(type: 'Staff', icon: Icons.people, number: '0', text1: 'You have', text2: ' 0', text3: ' staff',
         color: AppColor.primary),)
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
              _navigationService.navigateTo(staffRoute);
             },
            ),
    )
    );
  }


cards({String type, IconData icon, String number, String text1, String text2, String text3, Color color}){
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
            Icon(icon),
            horizontalSpaceSmall,
            Text(type, style: AppTextStyle.rampatBoldStyle(color, AppFontSizes.large2_1),)
          ]),
        ),
        horizontalSpaceLarge,

        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 9.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 6.9,
            child: Center(child: Text(number, 
            style: AppTextStyle.rampatBoldStyle(color, 48),)),),
        ),
         Expanded(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             Text(text1, style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             Text(text2, style: AppTextStyle.rampatBoldStyle(AppColor.darkGrey, AppFontSizes.medium),),
             Text(text3, style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),)
           ]),
         ),
     ],)
    ),
  );
}


}