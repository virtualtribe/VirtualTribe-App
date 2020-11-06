import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/model/FetchBankModel.dart';
import 'package:virtualtribe/src/MainApp/screens/RegisterInfoViewModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/locator.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegisterInformationScreen extends StatefulWidget {
  @override
  _RegisterInformationScreenState createState() => _RegisterInformationScreenState();
}

class _RegisterInformationScreenState extends State<RegisterInformationScreen> {
  
  TextEditingController fullNameController, emailController, phoneNumberController, accountNumberController, // ,
  bankNameController, accountNameController, homeAddressController, guarantorNumberController, guarantorNameController,
  nameOfNextKinController, nameOfNextKinPhoneNumberController, dateOfBirthController;
BankData _fetchBankModel;
String bankName, bankCode;
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
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterInfoViewModel>.reactive(
      viewModelBuilder: () => RegisterInfoViewModel(),
      onModelReady: (model) => model.fetchBanks(
        emailCon: emailController,
        nameCon: fullNameController, ),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
           backgroundColor: AppColor.primary,
        title: Text('Create Profile', style: AppTextStyle.rampatStyle(AppColor.white, AppFontSizes.large)),
        ),
        body: SingleChildScrollView(
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
                     child: AbsorbPointer(
                       absorbing: true,
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
                     child: AbsorbPointer(
                       absorbing: true, child: Container(
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
                   ),
       // ==>>> PHONE NUMBER
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

                  Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                         color: AppColor.grey,
                         child: TextField(
                           controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                          cursorRadius: Radius.elliptical(10, 20),
                                decoration:  InputDecoration(
                                  hintText: ' 08112345678',
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
                    Text('Date of Birth ', 
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
                         child: TextFormField(
                              controller: dateOfBirthController,
                               keyboardType: TextInputType.number,
                              style: TextStyle(fontWeight: FontWeight.bold,),
                            
                              decoration:  InputDecoration(
                                  hintText: ' 1/10/1960',
                                   border: InputBorder.none,
                                  hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                ),   
                      onTap: (){
                          DatePicker.showDatePicker(
                         context,
                        showTitleActions: true,
                        onChanged: (date) {
                          String v = '${date.day}-${date.month}-${date.year}';
                          setCheckOutDate(value: v);

                        }, onConfirm: (date) {
                           String v = '${date.day}-${date.month}-${date.year}';
                          setCheckOutDate(value: v);
                         
                        }, currentTime: DateTime.now(), 
                        locale: LocaleType.en);
                      },
                        ),
                       ),
                   ),

//==>>>BANK DETAILS
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
                            keyboardType: TextInputType.number,
                          cursorRadius: Radius.elliptical(10, 20),
                           decoration:  InputDecoration(
                                  hintText: ' 9201313131',
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
                         child: (model.isBusy ? _customFuntion.loaderPrimay()
                          : model.displayMessage == null ? DropdownButton<BankData>(
                            isExpanded: true,
                             iconEnabledColor: AppColor.primary,
                                underline: SizedBox(),
                                hint: Text('Select Bank'),
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
                     absorbing: true,
                      child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Container(
                           color: AppColor.grey,
                           child: (model.loader ?  _customFuntion.loaderPrimay()
                            : (model.displayMessage2 == null ?  TextField(
                             controller: accountNameController,
                             onChanged: (value){
                               value = model.getAccountName;
                               print('**** VALUE ***** ${model.getAccountName}');
                             },
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                    hintText: ' Ola Olajire',
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ), )
                            : _customFuntion.errorUimessage(context: context, errorMessage: model.displayMessage2 ,
                              type: model.displayMessageType2))
                                  )
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
                                  hintText: ' No 30, Amure street',
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
                                  hintText: ' Mr Ajanlekoko',
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
                            keyboardType: TextInputType.number,
                          cursorRadius: Radius.elliptical(10, 20),
                                decoration:  InputDecoration(
                                  hintText: '0990XXXXXX',
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
                                  hintText: 'Olajire N',
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
                           keyboardType: TextInputType.number,
                                decoration:  InputDecoration(
                                  hintText: '0918xxxxx',
                                   border: InputBorder.none,
                                  hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                ),
                                    ),
                       ),
                   ),
                 
                  _customFuntion.errorUimessage(errorMessage:
                   model.displayMessage3, type: model.displayMessageType3,
                              context: context),
                  
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
                                child: (model.loader3 ?  _customFuntion.loader()
                                : Text('REGISTER',
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
                          model.register(
                            accountName:  accountNameController.text,
                            bankName: bankNameController.text,
                            accountNumber: accountNumberController.text,
                            //email: "horlazTesters@g.com", //emailController.text,
                           //fullName: 'Tester', // accountNameController.text,//Account name must be d same as user full name//fullNameController.text,
                            phoneN: phoneNumberController.text,
                            guarantorName:guarantorNameController.text,
                            guarantorNumber: guarantorNumberController.text,
                            homeAddress: homeAddressController.text,
                            nameOfNextKinController: nameOfNextKinController.text,
                            nameOfNextKinPhoneNumberController: nameOfNextKinPhoneNumberController.text,
                            dateoFBirth: dateOfBirthController.text
                          );
                        },
                      ),
       
          ],
      ),
        ),   )     
    );
  }
  
   setCheckOutDate({String value}){
    setState(() {
dateOfBirthController.text = value;
    });
  }
}