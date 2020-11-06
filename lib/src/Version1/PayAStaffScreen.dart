import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/Version1/viewmodel/PayAStaffViewModel.dart';
import 'package:virtualtribe/src/locator.dart';

class PayAStaffScreen extends StatefulWidget {
  final List staffDetails;
  const PayAStaffScreen({this.staffDetails});

  @override
  _PayAStaffScreenState createState() => _PayAStaffScreenState();
}

class _PayAStaffScreenState extends State<PayAStaffScreen> {
  final CustomFunction _customFuntion = locator<CustomFunction>();
  String id, name, email;
  TextEditingController nameController, emailController, amountController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: widget.staffDetails[1]); // 1 Name
    emailController = TextEditingController(text: widget.staffDetails[2]); //2 Email
     amountController = TextEditingController();
     print(widget.staffDetails[1]);
    print(widget.staffDetails[2]);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.staffDetails.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PayAStaffViewModel>.reactive(
      viewModelBuilder: () => PayAStaffViewModel(),
      onModelReady: (model) => model.searchByID(widget.staffDetails[0]),
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
        title: Text('Send Money', 
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
                           controller: amountController,
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
                    child: Row(children: <Widget>[
                    Text('User Email', 
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
                             controller: emailController,
                             onChanged: (value){
                               
                             },
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                    hintText: ' 071',
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ), )
                         ),
                     ),
                   ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: <Widget>[
                    Text('Full Name', 
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
                             controller: nameController,
                             onChanged: (value){
                               
                             },
                            cursorRadius: Radius.elliptical(10, 20),
                             decoration:  InputDecoration(
                                    hintText: ' OLa',
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                  ), )
                         ),
                     ),
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
                                : Text('SEND',
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
                          model.sendMoney(
                            amounts: amountController.text
                          );
                        },
                      ),

            ]
          )
        )
        )
    );
  }
}