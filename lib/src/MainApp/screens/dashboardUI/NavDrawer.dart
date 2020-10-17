import 'package:flutter/material.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppImage.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: UserAccountsDrawerHeader( 
              accountName: Text(
              'Olajire Abdllahi',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            accountEmail: Text(
              'horlaz229@gmail.com',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            currentAccountPicture: CircleAvatar(
                child: Image.asset(AppImage.applogo),
            ),
            ),
            decoration: BoxDecoration(
                
                color: Colors.white),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, size: 25,),
            title: Text('Dashboard', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, size: 25,),
            title: Text('Reports', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.add,size: 25,),
            title: Text('Submit a report', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.person,size: 25,),
            title: Text('Staff', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 25,),
            title: Text('Settings', style: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium),),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}