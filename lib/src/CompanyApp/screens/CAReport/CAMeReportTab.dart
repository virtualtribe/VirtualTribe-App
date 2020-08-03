import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:virtualtribe/src/CompanyApp/screens/CAReport/CAReportSViewModel.dart';

class CAMeReportTab extends StatefulWidget {
  @override
  _CAMeReportTabState createState() => _CAMeReportTabState();
}

class _CAMeReportTabState extends State<CAMeReportTab> {
  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<CAReportSViewModel>.reactive(
      viewModelBuilder: () => CAReportSViewModel(),
      builder: (context, model, child) => Container()
  );
  }
}