import 'package:flutter/material.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
   String _radioValue = 'one';
   String _value = 'value';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.white,
                   child: TextField(
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            hintText: 'Total No of staff \t\t 0',
                            hintStyle: AppTextStyle.rampatBoldStyle(AppColor.primary, AppFontSizes.medium)
                          ),
                              ),
                 ),
               ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Company Name', 
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
                            suffixIcon: Icon(Icons.edit, size: 20,),
                            hintText: '\t Virtual Tribe Africa',
                            hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small)
                          ),
                              ),
                 ),
               ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Reporting Frequency', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ],),
              ),
              Row(
  children: <Widget>[
      Radio(
          value: 1,
          groupValue: _value,
          onChanged: (value){
          },
          activeColor: Color(0xFF6200EE),
          
        ),
      Text(
              'Weekly',
              style: AppTextStyle.normalStyle(AppColor.darkGrey)
            ),
SizedBox(width: 20.0,),
      Radio(
          value: 2,
          groupValue: _value,
          onChanged: (value){
          },
          activeColor: Color(0xFF6200EE),
          
        ),
      Text(
              'Monthly',
              style: AppTextStyle.normalStyle(AppColor.darkGrey)
            ),

  ],
),
      
       Expanded(
                child: Align(
            alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                      child: Container(
                        height: 40,
                        child: Material(
                          child: Center(
                            child: Text('SAVE',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          color:  AppColor.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              side: BorderSide(color: AppColor.primary)
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      
                    },
                  ),
         ),
       )
              
      ],
    );
  }


}