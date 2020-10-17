import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/Staff/StaffViewModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/locator.dart';

class TeamTabScreen extends StatefulWidget {
  @override
  _TeamTabScreenState createState() => _TeamTabScreenState();
}

class _TeamTabScreenState extends State<TeamTabScreen> {
final CustomFunction _developerFunction = locator<CustomFunction>();
   int _value = 0; int _value1 = 0;
   List<String> staffSupervisor;
    String _selectedSepervisors;
   int role, management;
   TextEditingController emailController;


   setRole(int v){
    setState(() {
      role = v;
      _value = v;
    });
  }

   setManagement(int v){
    setState(() {
      management = v;
      _value1 = v;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<StaffViewModel>.reactive(
      viewModelBuilder: () => StaffViewModel(),
      onModelReady: (model) => model.showData(),
      builder: (context, model, child) => ListView(
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
                       controller: emailController,
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
                setRole(value);
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
                setRole(value);
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
                setRole(value);
            },
            activeColor: Color(0xFF6200EE), ),
        Text(
                'Admin',
                style: AppTextStyle.rampatStyle(AppColor.darkGrey, 12)
              ),

  ],
),

                 Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: FindDropdown(
                        items: model.staffSupervisor,
                        label: "Select Staff Supervisor",
                        labelStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, 12),
                        onChanged:(value){
                          _selectedSepervisors = value;
                        },
                        selectedItem: 'staff@virtualwork.ng',
                        validate: (item) {
                          if (item == null)
                            return "Required field";
                          else if (item == "Adobe")
                            return "Invalid item";
                          else
                            return null;
                        },
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
            groupValue: _value1,
            onChanged: (value){
              setManagement(value);
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
            groupValue: _value1,
            onChanged: (value){
              setManagement(value);
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
                 SizedBox(width: 10.0,),
                _developerFunction.errorUimessage(errorMessage: model.getmessage, type: model.errorType, context: context),
                 SizedBox(width: 10.0,),
        
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
                              child: (model.isBusy ? _developerFunction.loader() 
                              : Text('Send invite'.toUpperCase(),
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold
                                ),))
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
                     String userRole =  _developerFunction.roleValue(role);
                   
                        model.proceed(mail: emailController.text, supervisor: _selectedSepervisors, 
                        role: userRole, management:management.toString()); 
                      },),
           ),
         )
      
        ],
      )
   
   );
  }
}