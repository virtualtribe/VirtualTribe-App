import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/Version1/viewmodel/WithdrawViewModel.dart';
import 'package:virtualtribe/src/locator.dart';

class WithdrawScreen extends StatefulWidget {
  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  TextEditingController amountsController, bankNameController, accountNumberController, accountNameController;
 final CustomFunction _customFuntion = locator<CustomFunction>();
 final FirestoreService _firestoreService = locator<FirestoreService>();
  final CustomFunction _customFunction = locator<CustomFunction>();
 
 @override
  void initState() {
    super.initState();
    amountsController = TextEditingController(); 
    bankNameController = TextEditingController();
    accountNumberController = TextEditingController();
    accountNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
     return ViewModelBuilder<WithdrawViewModel>.reactive(
      viewModelBuilder: () => WithdrawViewModel(),
      onModelReady: (model) => model.initialized(
        accountNameController: accountNameController,
        accountNumberController: accountNumberController,
        bankNameController: bankNameController,
      ),
      builder: (context, model, child) =>
      Scaffold(
        appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,),
          onPressed: (){
           Navigator.of(context).pop(); //NAVIGATE BACK
          },
        ),
        title: Text('Withdraw Money', 
        style: AppTextStyle.rampatStyle(AppColor.white, AppFontSizes.large)),
        ),
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: Column(
            children:[
              //==>>>BANK DETAILS
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: <Widget>[
                    Text('Amounts', 
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
                           controller: null,
                            keyboardType: TextInputType.number,
                          cursorRadius: Radius.elliptical(10, 20),
                           decoration:  InputDecoration(
                                  hintText: ' Enter Amounts',
                                   border: InputBorder.none,
                                  hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                ),
                                    ),
                       ),
                   ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
               child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                      Expanded(
                      child: Text('Your funds will be withdraw into this account, If you don\'t want this bank account, Goto your profile page to change it', 
                     textAlign: TextAlign.center,
                          style:  TextStyle(
                        color: AppColor.primaryDark,
                        fontSize: AppFontSizes.small,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    )
                  ]
                ),),
                  Column(
                   children: [
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
                     absorbing: true,
                      child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Container(
                           color: AppColor.grey,
                           child:  TextField(
                             controller: bankNameController,
                             onChanged: (value){
                               
                             },
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ), )
                         ),
                     ),
                   ),

                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: <Widget>[
                    Text('Account Number', 
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
                           child:  TextField(
                             controller: accountNumberController,
                             onChanged: (value){
                               
                             },
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ), )
                         ),
                     ),
                   ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: <Widget>[
                    Text('Account Name', 
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
                           child:  TextField(
                             controller: accountNameController, 
                             onChanged: (value){
                               
                             },
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ), )
                         ),
                     ),
                   ),
                   ],
                 ),
                   SizedBox(
                    height: 20,
                  ),

                   _customFuntion.errorUimessage(errorMessage:
                   model.displayMessage, type: model.displayMessageType,
                              context: context),

                   GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                          child: Container(
                            height: 40,
                            child: Material(
                              child: Center(
                                child: (model.loader ?  _customFuntion.loader()
                                : Text('Proceed',
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
                          model.proceed(amounts: amountsController.text);
                        },
                      ),

            ]
          )
        )
        )
    );
  }
}