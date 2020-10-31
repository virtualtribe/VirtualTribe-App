import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:virtualtribe/src/MainApp/styles/AppColor.dart';
import 'package:virtualtribe/src/MainApp/styles/AppImage.dart';
import 'package:virtualtribe/src/Version1/viewmodel/V1DashboardViewModel.dart';
import 'package:stacked/stacked.dart';

class V1Dashboard extends StatefulWidget {
  @override
  _V1DashboardState createState() => _V1DashboardState();
}

class _V1DashboardState extends State<V1Dashboard> {

  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context, width: 1080, height: 2160, allowFontScaling: false); 

      return ViewModelBuilder<V1DashboardViewModel>.reactive(
      viewModelBuilder: () => V1DashboardViewModel(),
      onModelReady: (model) => model.initialized(),
      builder: (context, model, child) =>
      Container(
              color: Colors.red,
              child: Scaffold(
                backgroundColor: AppColor.primary,
                body: Stack(
                  children: <Widget>[
                    Column(children: <Widget>[
                      AspectRatio(
                          aspectRatio: 1.0,
                          child: Container(
                              //color: AppColor.primary,
                              decoration: BoxDecoration(
                                color: AppColor.primary.withOpacity(0.10),
                                image: DecorationImage(
                                  colorFilter: new ColorFilter.mode(
                                      AppColor.primary.withOpacity(0.10),
                                      BlendMode.dstATop),
                                  image: AssetImage(AppImage.applogo),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
            margin: EdgeInsets.symmetric(horizontal: 1, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: GestureDetector(
                        child: CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColor.primary,
                                child: ClipOval(
                                  child: Icon(Icons.menu, size: 30),
                                ),
                                ),
                                onTap: (){
                                // model.gotoProfile();
                                },
                        ),
                      ) 
                        ),
                     Column(
                          children: [
                    Text(model.walletBalance == null ? "" : "\₦${model.walletBalance}", textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, 
                    fontSize: 36, 
                     fontWeight: FontWeight.w700),),
                  Text("Available Balance", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.blue[100]),),
                          ],
                        ),
                     Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: GestureDetector(
                        child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: Image.asset(AppImage.applogo, fit: BoxFit.contain,),
                                ),
                                ),
                                onTap: (){
                                 model.gotoProfile();
                                },
                        ),
                      )
                        
                        ),
                  ]),
                    
                   SizedBox(height : 18,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                            GestureDetector(
                         child: Container(
                         child: Column(
                           children: <Widget>[
                               Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 245, 248, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(FontAwesome5.money_bill_wave, color: Colors.blue[900], size: 30,),
                                padding: EdgeInsets.all(12),
                          ),
                              
                          SizedBox(
                              height: 4,
                          ),
                          Text("Withdraw", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
                           ],
                         )
                         ),
                         onTap:(){
                           model.gotoWithraw();
                         }
                            ), 


                           Container(
                         child: GestureDetector(
                          child: Column(
                             children: <Widget>[
                               Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 245, 248, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(FontAwesome5.money_check, color: Colors.blue[900], size: 30,),
                                padding: EdgeInsets.all(12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Send Money", style: TextStyle(fontWeight: FontWeight.w700,
                             fontSize: 14, color: Colors.blue[100]),),
                             ],
                           ),
                           onTap: (){
                               model.gotoSendMoney();
                           },
                         )
                         ),

                          Padding(
                            padding: const EdgeInsets.only(right: 13.0),
                            child: GestureDetector(
                            child: Container(
                         child: Column(
                               children: <Widget>[
                                 Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(243, 245, 248, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                  ),
                                  child: Icon(Icons.change_history, color: Colors.blue[900], size: 30,),
                                  padding: EdgeInsets.all(12),
                              ),
                                
                              SizedBox(
                                height: 4,
                              ),
                              Text("History", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
                               ],
                         )
                         ),
                           onTap: (){
                             model.gotoWalletHistory();
                           },
                            ),
                          ), ],), ],
                                )
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                              height: 4,
                            ),
                       Text("Hi ${model.name}. Welcome to ${model.companyName}", 
                      textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, 
                    fontSize: 25, 
                     fontWeight: FontWeight.w700),),
                    ],)
                    ]),
                ),
              )
            ),
            ]),

             Positioned(
                      top: (MediaQuery.of(context).size.width / 1.70),
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.white, //Color(0xFFF1F3F6),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: Offset(5, 5),
                                color: Color(0xFF4D70A6).withOpacity(0.2),
                                blurRadius: 16),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, left: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 40.0, right: 10, left: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                              Container(
                         child: GestureDetector(
                                                    child: Column(
                             children: <Widget>[
                               Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(FontAwesome5.clock, color: Colors.white, size: 30,),
                                padding: EdgeInsets.all(12),
                            ),
                              
                            SizedBox(
                              height: 4,
                            ),
                            Text("Weekly Timesheet", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColor.black),),
                             ],
                           ),
                           onTap: (){
                             model.gotoTimesheet();
                           },
                         )
                         ), 

                             Container(
                         child: GestureDetector(
                                                    child: Column(
                             children: <Widget>[
                               Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(FontAwesome5.user_shield, color: Colors.white, size: 30,),
                                padding: EdgeInsets.all(12),
                            ),
                              
                            SizedBox(
                              height: 4,
                            ),
                            Text("Activities", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColor.black),),
                             ],
                           ),
                           onTap:(){
                              model.gotoActivities();
                           }
                         )
                         ), 

                         Container(
                         child: GestureDetector(
                           child: Column(
                             children: <Widget>[
                               Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(FontAwesome5.user_alt, color: Colors.white, size: 30,),
                                padding: EdgeInsets.all(12),
                            ),
                              
                            SizedBox(
                              height: 4,
                            ),
                            Text("Profile", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14,
                             color: AppColor.black),),
                             ],
                           ),
                           onTap: (){
                              model.gotoProfile();
                           },
                         ),                        
                         ),  ],),

                         SizedBox(
                              height: 40,
                            ),

                         
                         Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                         child: GestureDetector(
                           child: Column(
                             children: <Widget>[
                               Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(FontAwesome5.people_arrows, color: Colors.white, size: 30,),
                                padding: EdgeInsets.all(12),
                            ),
                              
                            SizedBox(
                              height: 4,
                            ),
                            Text("All Staff", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14,
                             color: AppColor.black),),
                             ],
                           ),
                           onTap: (){
                              model.gotoViewAllStaff();
                           },
                         ),                        
                         ),
                             
                           ],
                         )
                                           
                                          ],
                                        )),
                                    
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
            ])
            )));
  }
}