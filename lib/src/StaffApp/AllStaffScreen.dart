import 'package:flutter/material.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/widget/AllStaffTable.dart';
class AllStaffScreen extends StatefulWidget {
  @override
  _AllStaffScreenState createState() => _AllStaffScreenState();
}

class _AllStaffScreenState extends State<AllStaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                leading: Icon(Icons.arrow_back, size: 30, color: Colors.grey,),
                title:Text('All Staff', 
                style:  TextStyle(
              color: AppColor.black,
              fontSize: AppFontSizes.large,
              fontWeight: FontWeight.bold
            )
          ),
      ),
      body: Column(
      children: <Widget>[
        Expanded(
          child: AllStaffTable(
      ),
    )
      ],
    )
    );
  }
}