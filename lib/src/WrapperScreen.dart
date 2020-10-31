import 'package:flutter/material.dart';
import 'package:virtualtribe/src/MainApp/services/navigation_service.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppImage.dart';
import 'package:virtualtribe/src/MainApp/styles/AppText.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/constants.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/WrapperViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/locator.dart';

class WrapperScreen extends StatefulWidget {
  @override
  _WrapperScreenState createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
   final CustomFunction _customFuntion = locator<CustomFunction>();
   final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
      viewModelBuilder: () => WrapperViewModel(),
      onModelReady: (model) => model.handleStartUp(), //Handle Auth. Local DB etc, 
      builder: (context, model, child) =>
      Scaffold(
        backgroundColor: AppColor.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(AppImage.applogo, width: 150,), //height: 100,
               SizedBox(height: 5,), 
              Text(AppText.slogan,
                style: AppTextStyle.normalStyle(AppColor.black),),
              SizedBox(height: 5,),
              SizedBox(height: 30,),
              (model.message != null || model.getErrorToken != null 
              ? Center(child:_customFuntion.errorUimessage(
                context: context,
                errorMessage: model.message == null ? model.getErrorToken : model.message,
                type: model.errorType
               )) : CircularProgressIndicator()),

       (model.message == null ? Container() : GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                          child: Container(
                            height: 40,
                            child: Material(
                              child: Center(
                                child: Text('Retry',
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
                          model.handleStartUp();
                        },
                      )),

            (model.getErrorToken == null ? Container() : GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                          child: Container(
                            height: 40,
                            child: Material(
                              child: Center(
                                child: Text('Validate Token',
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
                         _navigationService.navigateToandRemove(registerRoute);
                        },
                      ))
            ],
          ),
        )
    ));
  }
}