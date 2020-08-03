import 'package:flutter/material.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';

class TeamTabScreen extends StatefulWidget {
  @override
  _TeamTabScreenState createState() => _TeamTabScreenState();
}

class _TeamTabScreenState extends State<TeamTabScreen> {
  String _radioValue = 'one';
   String _value = 'value';


  @override
  Widget build(BuildContext context) {
     return Column(
      children: <Widget>[
         SizedBox(height: 15,),
        Text('An invite link will be sent to the staff email address', 
             style: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small),),
             SizedBox(height: 10,),

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
                Text('Role', 
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
              'Staff',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),
SizedBox(width: 10.0,),
      Radio(
          value: 2,
          groupValue: _value,
          onChanged: (value){
          },
          activeColor: Color(0xFF6200EE),
          
        ),
      Text(
              'Supervisor',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),
            SizedBox(width: 10.0,),
      Radio(
          value: 3,
          groupValue: _value,
          onChanged: (value){
          },
          activeColor: Color(0xFF6200EE),
          
        ),
      Text(
              'Admin',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),

  ],
),

Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.grey,
                   child: TextField(
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down, size: 20,),
                            hintText: 'Select Staff Supervisor',
                            hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small)
                          ),
                              ),
                 ),
               ),
Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Employee Management', 
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
              'Attendance Based',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),
SizedBox(width: 10.0,),
      Radio(
          value: 2,
          groupValue: _value,
          onChanged: (value){
          },
          activeColor: Color(0xFF6200EE),
          
        ),
      Text(
              'Time Sheet Based',
              style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
            ),
            SizedBox(width: 10.0,),
     

  ],
),
         
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text('Click here to learn more',
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                        decoration: TextDecoration.underline , 
                    color: Colors.blue,
                    fontSize: AppFontSizes.small,
                  ),
                ),
                ],),
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
                            child: Text('Send invite'.toUpperCase(),
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