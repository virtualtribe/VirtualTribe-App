import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppImage.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/Version1/viewmodel/V1DashboardViewModel.dart';

class V1NavDrawer extends StatelessWidget {
  final V1DashboardViewModel model;

  const V1NavDrawer({this.model});

   @override
  Widget build(BuildContext context) {
    return Drawer(
     
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(

            child: UserAccountsDrawerHeader( 
              arrowColor: Colors.white,
              margin: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                 shape: BoxShape.circle,
                color: AppColor.primaryDark),
              accountName: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                 model.name == null ? '' : model.name,
                 textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
            ),
              ),
            accountEmail: Text(
              model.email == null ? '' : model.email,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CircleAvatar(
                  child: Image.asset(AppImage.applogo),
              ),
            ),
            ),
            decoration: BoxDecoration(
                color: AppColor.primaryDark)
          ),
          ListTile(
            leading: Icon(Icons.dashboard, size: 25,),
            title: Text('Dashboard', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
            onTap: (){
              Navigator.of(context).pop();
              },
          ),
          ListTile(
            leading: Icon(FontAwesome5.clock, size: 25,),
            title: Text('TimeSheet', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
           onTap: (){
              model.gotoTimesheet();
              },
          ),
          ListTile(
            leading: Icon(FontAwesome5.user_shield,size: 25,),
            title: Text('Activities', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
            onTap: (){
              model.gotoActivities();
              },
          ),
          ListTile(
            leading: Icon(FontAwesome5.people_arrows,size: 25,),
            title: Text('Staffs', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
            onTap: (){
               model.gotoViewAllStaff();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 25,),
            title: Text('Settings', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
           onTap: (){
              Navigator.of(context).pop();
              },
          ),
        ],
      ),
    );
  }
}