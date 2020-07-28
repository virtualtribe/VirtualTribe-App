import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/screens/signUp/SignUpDialogViewModel.dart';
import 'package:virtualtribe/src/styles/AppColor.dart';
import 'package:virtualtribe/src/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/widget/uihelper.dart';

class SignUpDialog extends StatefulWidget {
  @override
  _SignUpDialogState createState() => _SignUpDialogState();
}

class _SignUpDialogState extends State<SignUpDialog> {
  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder<SignUpDialogViewModel>.reactive(
      viewModelBuilder: () => SignUpDialogViewModel(),
      builder: (context, model, child) =>  Center(
      child: Dialog(
        insetAnimationCurve: Curves.elasticInOut,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)),
          backgroundColor: Color(0xFFF7FCFE),
          child: Container(
             margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height /2.5,
          decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius:
            new BorderRadius.all(new Radius.circular(2.0)),
        ),
        child: Column(
          children: <Widget>[
            Text('Verify Email',  
            style: AppTextStyle.rampatStyle(AppColor.black, AppFontSizes.large2)),
            verticalSpaceMedium,
            Text('Enter the verification code sent to your email below and tap submit to continue.',
            style: AppTextStyle.rampatStyle(AppColor.black, AppFontSizes.smallest) ),
            verticalSpaceMedium,
            Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   color: AppColor.grey,
                   child: TextField(
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            border: InputBorder.none
                           
                          ),
                              ),
                 ),
               ),

                verticalSpaceSmall,
               Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
          onPressed: () {
            Navigator.of(context).pop();// To close the dialog
          },
          child: Text('Change Email', style: TextStyle(decoration: TextDecoration.underline , 
          color: AppColor.secondary,), ),
        ),

         FlatButton(
          onPressed: () {
            Navigator.of(context).pop(); // To close the dialog
            model.submit();
          },
          child: Text('SUBMIT', style: TextStyle(color: AppColor.primary), ),
        ),
        ],
      )

          ],
        ),




          ),
          
      )
    )
    );
}
}