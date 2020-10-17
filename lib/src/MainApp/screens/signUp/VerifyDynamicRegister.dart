import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/signUp/VerifyDynamicRegisterVM.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppText.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/widget/uihelper.dart';
import 'package:virtualtribe/src/locator.dart';

class VerifyDynamicRegister extends StatefulWidget {
    var data;

   VerifyDynamicRegister({this.data});
  @override
  _VerifyDynamicRegisterState createState() => _VerifyDynamicRegisterState();
}

class _VerifyDynamicRegisterState extends State<VerifyDynamicRegister> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyDynamicRegisterVM>.reactive(
       viewModelBuilder: () => VerifyDynamicRegisterVM(),
      onModelReady: (model) => model.initialize(data: widget.data, context: context),
      builder: (context, model, child) =>
          Scaffold(
        body:  (model.getErrorMessage == null || model.isBusy ?
                   Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Container(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(
                    strokeWidth: 8,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary, ),
                          backgroundColor: AppColor.secondary,
                    ),
                  ),
                
                  SizedBox(height: 30,),
                  Center(
                    child: Text('Hold on while we are verifying you... It will only take a few seconds',
                     textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                    fontSize: AppFontSizes.medium,
                    fontWeight: FontWeight.bold
                              ),),
                             
                  ),
                ],
              ),
            ): errorWidget(model, widget.data)
        )
      ),
    );
  }
   errorWidget(VerifyDynamicRegisterVM model, List<String> data){
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Container(
                  height: 60,
                  width: 60,
                  child: Icon(Icons.cancel, size: 70, color: Colors.red,)
                ),
                SizedBox(height: 30,),
                Center(
                  child: Text(model.getErrorMessage,
                   textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                  fontSize: AppFontSizes.medium,
                  fontWeight: FontWeight.bold
                            ),),
                           
                ),
                verticalSpaceLarge,
                GestureDetector(child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: 150,
                      height: 50,
                      child: Material(
                      child: Center(
                          child: Text('Retry',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                      color: Color(0xFF45A1C9),
                      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: AppColor.secondary)
    ),
                   
                ),
                    ),
                  ),
                  onTap: (){
                    model.initialize(data: widget.data, context: context);
                    model.setErrorMessage(erorr: null);
                  },
                        ),

                        //***GO BACK BUTTON */
                        verticalSpaceMedium,
                        verticalSpaceMedium,
                GestureDetector(child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: 150,
                      height: 50,
                      child: Material(
                      child: Center(
                          child: Text('Back',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                      color: Color(0xFF45A1C9),
                      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: AppColor.secondary)
    ),
                   
                ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pop(context);
                    _navigationService.navigateToandRemove(registerRoute);
                  },
                        ),
              ],
            );
  }
  
}