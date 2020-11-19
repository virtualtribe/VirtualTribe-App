import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/MainApp/screens/Settings/SettingsViewModel.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppFontSizes.dart';
import 'package:virtualtribe/src/MainApp/styles/AppTextStyle.dart';
import 'package:virtualtribe/src/MainApp/utils/customFunction.dart';
import 'package:virtualtribe/src/locator.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  // String _radioValue = 'one';
   int _value;
   int reporting;

    final CustomFunction _customFuntion = locator<CustomFunction>();
   TextEditingController nameController, staffNoController;

 @override
  void initState() {
    super.initState();
    nameController = TextEditingController(); 
    staffNoController =  TextEditingController(); 
  }

  setValue(int v){
    setState(() {
      reporting = v;
      _value = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
       onModelReady: (model) => model.showData(staffNo: staffNoController, title: nameController),
      builder: (context, model, child) =>  Column(
      children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Total No of staff', 
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
                     controller: staffNoController,
                     keyboardType: TextInputType.number,
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            suffixIcon: Icon(Icons.edit, size: 20,),
                            hintText: '\t0',
                            hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small)
                          ),
                              ),
                 ),
               ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Company Name', 
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
                     controller: nameController,
                    cursorRadius: Radius.elliptical(10, 20),
                          decoration:  InputDecoration(
                            suffixIcon: Icon(Icons.edit, size: 20,),
                            hintText: '\t Virtual Tribe Africa',
                            hintStyle: AppTextStyle.rampatStyle(AppColor.darkGrey, AppFontSizes.small)
                          ),
                              ),
                 ),
               ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                Text('Reporting Frequency', 
                 textAlign: TextAlign.left,
                      style:  TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.small,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ],),
              ),
              Row(
  children: <Widget>[
      Radio(
          value: 1,
          groupValue:(model.freq == 0 ? _value : model.freq),
          onChanged: (value){
            setValue(value);
          },
          activeColor: Color(0xFF6200EE),
        ),
      Text(
              'Weekly',
              style: AppTextStyle.normalStyle(AppColor.darkGrey, AppFontSizes.smallest)
            ),
SizedBox(width: 20.0,),
      Radio(
          value: 2,
          groupValue: (model.freq == 0 ? _value : model.freq),
          onChanged: (value){
            setValue(value);
          },
          activeColor: Color(0xFF6200EE),
          
        ),
      Text(
              'Monthly',
              style: AppTextStyle.normalStyle(AppColor.darkGrey, AppFontSizes.smallest)
            ),

  ],
),
_customFuntion.errorUimessage(errorMessage: model.displayMessage, type: model.displayMessageType, context: context),
    
       Expanded(
                child: Align(
            alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0, right:6.0, bottom: 20),
                      child: Container(
                        height: 40,
                        child: Material(
                          child: Center(
                            child: model.isBusy ? _customFuntion.loader() : Text('SAVE',
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
                      model.proceedToCreateCompanY(staffNo: int.parse(staffNoController.text),
                       reportType: reporting, companyName:nameController.text);
                    },
                  ),
         ),
       )
              
      ],
    )
    );
  }


}