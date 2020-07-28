import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/widget/SignUpDialog.dart';

class SignUpViewModel extends BaseViewModel{


showRetryDialog(BuildContext context){
  return showDialog(
            context: context,
            builder: (BuildContext context) {
              return SignUpDialog();});
}
}