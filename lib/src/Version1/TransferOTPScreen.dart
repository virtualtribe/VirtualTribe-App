import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/Version1/viewmodel/TransferOTPViewModel.dart';
import 'package:virtualtribe/src/locator.dart';

class TransferOTPScreen extends StatefulWidget {
  final List<String> value ;

 const TransferOTPScreen({this.value});

  @override
  _TransferOTPScreenState createState() => _TransferOTPScreenState();
}

class _TransferOTPScreenState extends State<TransferOTPScreen> {
  final CustomFunction _customFuntion = locator<CustomFunction>();
  TextEditingController otpController = new TextEditingController();
 String transferCode, amountToWithdraw;


  @override
  void initState() {
    super.initState();
    transferCode = widget.value[0];
    amountToWithdraw =  widget.value[1];
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransferOTPViewModel>.reactive(
    viewModelBuilder: () => TransferOTPViewModel(),
    builder: (context, model, child) =>
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primary,
            title: Text('OTP Screen',
                style: AppTextStyle.rampatStyle(AppColor.white,
                    AppFontSizes.large)),
          ),
          backgroundColor: AppColor.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OTP Screen'),
               //==>>>BANK DETAILS
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: <Widget>[
                    Text('OTP Code', 
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
                           controller: otpController,
                            keyboardType: TextInputType.number,
                          cursorRadius: Radius.elliptical(10, 20),
                           decoration:  InputDecoration(
                                  hintText: ' Enter OTP',
                                   border: InputBorder.none,
                                  hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.medium)
                                ),
                                    ),
                       ),
                   ),
              
              SizedBox(
                height: 20,
              ),

              _customFuntion.errorUimessage(
              errorMessage: model.displayMessage,
              type: model.displayMessageType,
              context: context
              ),

              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                  child: Container(
                    height: 40,
                    child: Material(
                      child: Center(
                          child: (model.isBusy ?  _customFuntion.loader()
                              : Text('SEND',
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            ),
                          ))
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

                  model.finalTransfer(
                    transferCode: transferCode,
                    otpCode:otpController.text,
                    amounts: amountToWithdraw
                  );

                },
              ),

            ],
          ),
        )

    );
  }
}
