import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/FetchBankModel.dart';
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
  BankData _fetchBankModel;
  String bankName, bankCode;

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
                        //  model.logout(); //TODO LOGOUT HERE..
                        }
                      ),

                      GestureDetector(
                         child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(FontAwesome.edit, size: 30, color:  Colors.white,),
                        ),
                        onTap:(){
                        if(model.getEdit){
                             model.editable(value: false);
                        }else{
                           model.editable(value: true);
                        }
                        }
                      ),
                    ],
        ),
        body:  SingleChildScrollView(
                  child: AbsorbPointer(
                    absorbing: model.getEdit,
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
             

             AbsorbPointer(
                      absorbing: true,
                            child: Padding(
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
                         child: AbsorbPointer(
                      absorbing: true,
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
                     ),
                     
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
                         child:  AbsorbPointer(
                      absorbing: model.getEdit,
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
                 
                     AbsorbPointer(
                      absorbing: model.getEdit,
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Container(
                           color: AppColor.grey,
                           child: (model.isBusy ? _customFuntion.loaderPrimay()
                            : model.displayMessage == null ? DropdownButton<BankData>(
                              isExpanded: true,
                               iconEnabledColor: AppColor.primary,
                                  underline: SizedBox(),
                                  hint: Text(bankNameController.text),
                                  value: _fetchBankModel,
                                  onChanged: (value) {
                                    setState(() {
                                      _fetchBankModel = value;
                                       bankName = value.name; 
                                       bankCode = value.code;
                                       bankNameController.text = bankName;
                                       //Fetching user account full name
                                       model.fetchingBankInfo(accountNo: accountNumberController.text, 
                                       code:bankCode, acctcontroller:  accountNameController);
                                        // print(accountNumberController.text);
                                        // print(bankCode);
                                    });
                                  },
                                  items: model.getBank().map((BankData lang) {
                                  return DropdownMenuItem<BankData>(
                                            value: lang, 
                                            child: Text(lang.name.toString(), //Show Name 
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                                          );
                                              }).toList(),
                                
                                ) : _customFuntion.errorUimessage(context: context, errorMessage: model.displayMessage ,
                                type: model.displayMessageType)
                                )
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

                     AbsorbPointer(
                      absorbing: model.getEdit,
                       child: Padding(
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
                         child: AbsorbPointer(
                      absorbing: model.getEdit,
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
                         child: AbsorbPointer(
                      absorbing: model.getEdit,
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
                         child: AbsorbPointer(
                      absorbing: model.getEdit,
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
                         child: AbsorbPointer(
                      absorbing: model.getEdit,
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
                         child: AbsorbPointer(
                      absorbing: model.getEdit,
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
                     ),

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

                    AbsorbPointer(
                      absorbing: true,
                    child: Padding(
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
                    ),
                   
                    SizedBox(
                      height: 20,
                    ),
                    
       GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                          child: Container(
                            height: 40,
                            child: Material(
                              child: Center(
                                child: Text('Update',
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                  ),)
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
                          model.update(
                            accountNameController: accountNameController,
                            accountNumberController: accountNumberController,
                            bankNameController: bankNameController,
                            dateOfBirth: dateOfBirthController,
                            guarantorNameController: guarantorNameController,
                            guarantorNumberController: guarantorNumberController,
                            homeAddressController: homeAddressController,
                            nameOfNextKinController: nameOfNextKinController,
                            nameOfNextKinPhoneNumberController: nameOfNextKinPhoneNumberController,
                            phoneNumberController: phoneNumberController,
                          );
                          
                        },
                      ), 
          ],
      ),
                  ),
        ),
       )
    );
  }
}