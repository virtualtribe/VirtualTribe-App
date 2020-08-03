import 'package:flutter/material.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';

class PersonalSettigsTab extends StatefulWidget {
  @override
  _PersonalSettigsTabState createState() => _PersonalSettigsTabState();
}

class _PersonalSettigsTabState extends State<PersonalSettigsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Email Address *', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                ],),
              ),
        
        Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.grey,
                   child: TextField(
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            hintText: 'aderonke@virtualtribe.ng',
                             border: InputBorder.none,
                            hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small)
                          ),
                              ),
                 ),
               ),

         Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Full Name ', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                ],),
              ),
          
        

      ],
    );
 
  }
}