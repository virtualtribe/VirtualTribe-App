import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/screens/signUp/SignUpViewModel.dart';
import 'package:virtualtribe/src/styles/AppColor.dart';
import 'package:virtualtribe/src/styles/AppText.dart';
import 'package:virtualtribe/src/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/widget/uihelper.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(AppText.sigUpT1, style: AppTextStyle.normalStyle(AppColor.darkGrey),),
              verticalSpaceMedium,
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.grey,
                   child: TextField(
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            hintText: AppText.sigUpT2,
                          ),
                              ),
                 ),
               ),
               verticalSpaceLarge,
                GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                  child: Container(
                    height: 50,
                    child: Material(
                      child: Center(
                        child: Text(AppText.sigUpT3,
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
                  model.showRetryDialog(context);
                },
              )
              
            ],
          ),
        ),
      ),
    );
  }
}