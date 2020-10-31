import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/Version1/viewmodel/V1ProfileScreenViewModel.dart';
import 'package:virtualtribe/src/locator.dart';

class V1ProfileScreen extends StatefulWidget {
  @override
  _V1ProfileScreenState createState() => _V1ProfileScreenState();
}

class _V1ProfileScreenState extends State<V1ProfileScreen> {
   TextEditingController emailController, fullNameController, phoneNumberController, accountNumberController, 
  bankNameController, accountNameController, homeAddressController, guarantorNumberController, guarantorNameController,
  nameOfNextKinController, nameOfNextKinPhoneNumberController, dateOfBirthController;
  TextEditingController userIdController,  lastActivitiesController; // emailController, fullNameController;

 final CustomFunction _customFuntion = locator<CustomFunction>();
  
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(); //for First Name input
    fullNameController = TextEditingController(); //for Last Name input
    phoneNumberController =  TextEditingController();
    accountNumberController =  TextEditingController();
    bankNameController =  TextEditingController();
    accountNameController = TextEditingController();
    homeAddressController = TextEditingController();
     guarantorNumberController = TextEditingController();
     guarantorNameController = TextEditingController();
    nameOfNextKinController = TextEditingController(); 
    nameOfNextKinPhoneNumberController = TextEditingController();
    dateOfBirthController = TextEditingController();
      userIdController = TextEditingController();
        lastActivitiesController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<V1ProfileScreenViewModel>.reactive(
      viewModelBuilder: () => V1ProfileScreenViewModel(),
      onModelReady: (model) => model.initialized(
        accountNameController: accountNameController,
        emailController: emailController,
        fullNameController: fullNameController,
        lastActivitiesController: lastActivitiesController,
        userIdController: userIdController,
        phoneNumberController: phoneNumberController,
        accountNumberController:accountNumberController,
        bankNameController: bankNameController,
        homeAddressController: homeAddressController,
        guarantorNumberController: guarantorNumberController,
        guarantorNameController: guarantorNameController,
        nameOfNextKinController : nameOfNextKinController,
        nameOfNextKinPhoneNumberController: nameOfNextKinPhoneNumberController,
        dateOfBirth:  dateOfBirthController
      ),

       builder: (context, model, child) =>
       Scaffold(
         appBar: AppBar(
           backgroundColor: AppColor.primary,
        title: Text('Profile', style: AppTextStyle.rampatStyle(AppColor.white, AppFontSizes.large)),
        actions: <Widget>[
                      GestureDetector(
                         child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(FontAwesome.logout, size: 30, color:  Colors.white,),
                        ),
                        onTap:(){
                          model.logout(); //TODO LOGOUT HERE..
                        }
                      )
                    ],
        ),
        body:  SingleChildScrollView(
                  child: AbsorbPointer(
                    absorbing: true,
                     child: Column(
                    children: <Widget>[
            // ==>>> EMAIL
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
                                   border: InputBorder.none,
                                  hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                ),
                                    ),
                       ),
                     ),

// ==>>> NAME
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
                                   border: InputBorder.none,
                                  hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                ),
                                    ),
                       ),
                     ),
       // ==>>> PHONE NUMBER
             Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('User ID ', //Mobile Number
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
                             controller: userIdController, //phoneNumberController
                            cursorRadius: Radius.elliptical(10, 20),
                                  decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),
                     
// //==>>>BANK DETAILS
                    
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Bank Account Number', 
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
                             controller: accountNumberController,
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),

                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Bank Name', 
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
                             controller: bankNameController,
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),

                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Bank Account Name', 
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
                             controller: accountNameController,
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),

                      
                     //DOB
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Home Address ', 
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
                             controller: homeAddressController,
                            cursorRadius: Radius.elliptical(10, 20),
                                  decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),

                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Guarantor Name ', 
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
                              controller: guarantorNameController,
                            cursorRadius: Radius.elliptical(10, 20),
                                  decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),

                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Guarantor Number ', 
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
                             controller: guarantorNumberController,
                            cursorRadius: Radius.elliptical(10, 20),
                                  decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),

                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Name of Next of kin', 
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
                                controller: nameOfNextKinController,
                            cursorRadius: Radius.elliptical(10, 20),
                                  decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),

                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Next of kin phone number', 
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
                              controller: nameOfNextKinPhoneNumberController,
                            cursorRadius: Radius.elliptical(10, 20),
                                  decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),

                     //DOB
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                      Text('Last Activities ',  //Date of Birth
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
                             controller: lastActivitiesController, //dateOfBirthController
                            cursorRadius: Radius.elliptical(10, 20),
                                  decoration:  InputDecoration(
                                     border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ),
                                      ),
                         ),
                     ),
                   
                    SizedBox(
                      height: 20,
                    ),

      
          ],
      ),
                  ),
        ),
       )
      
    );
  }
}