import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/signUp/SignUpViewModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppText.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/MainApp/widget/uihelper.dart';
import 'package:virtualtribe/src/locator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 final CustomFunction _customFuntion = locator<CustomFunction>();

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      onModelReady: (model) => model.initializeDynamicLink(),
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
                   child: TextFormField(
                     keyboardType: TextInputType.emailAddress,
                     textDirection: TextDirection.ltr,
                     controller: emailController,
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            hintText: AppText.sigUpT2,
                          ),
                              ),
                 ),
               ),
verticalSpaceMedium,
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.grey,
                   child: TextField(
                     controller: passwordController,
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            hintText: '**********',
                          ),
                              ),
                 ),
               ),

               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text(model.message == null ? '' : '${model.message}', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.secondary,
                    fontSize: AppFontSizes.small,
                  ),
                ),
                ],),
              ),
               verticalSpaceLarge,
                GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                  child: Container(
                    height: 50,
                    child: Material(
                      child: Center(
                        child: (model.isBusy ? _customFuntion.loader() : Text(AppText.sigUpT3,
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
                  if(model.isBusy){

                  }else{
                     // model.signIn(emailController.text);
                     
                      model.loginwithV2API(
                        email: emailController.text,
                        pass: passwordController.text
                      );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}