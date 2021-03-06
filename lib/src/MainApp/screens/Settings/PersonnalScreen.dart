import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/Settings/SettingsViewModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';

class PersonnalScreen extends StatefulWidget {
  @override
  _PersonnalScreenState createState() => _PersonnalScreenState();
}

class _PersonnalScreenState extends State<PersonnalScreen> {
  TextEditingController emailController, fullNameController, phoneNumberController, bankNumberController, 
  bankNameController, accountNameController;

  
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(); //for First Name input
    fullNameController = TextEditingController(); //for Last Name input
    phoneNumberController =  TextEditingController();
    bankNumberController =  TextEditingController();
    bankNameController =  TextEditingController();
    accountNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) => model.initialized(phoneN: phoneNumberController, fullName: fullNameController,
      email: emailController, accountName: accountNameController, bankName: bankNameController, bankNo: bankNumberController
       ),
      builder: (context, model, child) => Column(
        children: <Widget>[
          Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                  Text('Email Address', 
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
                      controller: emailController,
                            decoration:  InputDecoration(
                              hintText: ' aderonke@virtualtribe.ng',
                               border: InputBorder.none,
                              hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
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

                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                     color: AppColor.grey,
                     child: TextField(
                       controller: fullNameController,
                      cursorRadius: Radius.elliptical(10, 20),
                            decoration:  InputDecoration(
                              hintText: ' Macauley Giddado',
                               border: InputBorder.none,
                              hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                            ),
                                ),
                   ),
                 ),
       
           Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                  Text('Mobile Number ', 
                   textAlign: TextAlign.left,
                        style:  TextStyle(
                      color: AppColor.black,
                      fontSize: AppFontSizes.small,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                  ],),
                ),

                Row(children: <Widget>[
                  Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                     width: 88,
                     color: AppColor.grey,
                     child: TextField(
                      cursorRadius: Radius.elliptical(10, 20),
                            decoration:  InputDecoration(
                              hintText: ' +234',
                               border: InputBorder.none,
                               suffixIcon: Icon(Icons.arrow_drop_down),
                              hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                            ),
                                ),
                   ),
                 ),
                  Expanded(
                                    child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       color: AppColor.grey,
                       child: TextField(
                         controller: phoneNumberController,
                        cursorRadius: Radius.elliptical(10, 20),
                              decoration:  InputDecoration(
                                hintText: ' 08112345678',
                                 border: InputBorder.none,
                                hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                              ),
                                  ),
                     ),
                 ),
                  ),


                ]),

                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                  Text('Bank Account Details', 
                   textAlign: TextAlign.left,
                        style:  TextStyle(
                      color: AppColor.black,
                      fontSize: AppFontSizes.small,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                  ],),
                ),

                 Row(children: <Widget>[
                  Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                     width: 88,
                     color: AppColor.grey,
                     child: TextField(
                      cursorRadius: Radius.elliptical(10, 20),
                         controller: bankNameController,
                            decoration:  InputDecoration(
                              hintText: ' Bank',
                               border: InputBorder.none,
                               suffixIcon: Icon(Icons.arrow_drop_down),
                              hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                            ),
                                ),
                   ),
                 ),
                  Expanded(
                                    child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       color: AppColor.grey,
                       child: TextField(
                         controller: accountNameController,
                        cursorRadius: Radius.elliptical(10, 20),
                         decoration:  InputDecoration(
                                hintText: ' Account Number',
                                 border: InputBorder.none,
                                hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                              ),
                                  ),
                     ),
                 ),
                  ),
                ]),

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
      ),
   
   
    );
  }
}