class CompanyModel{
  final int staffNo, reportFrequency, reportNo;
  final String comapanyName;
  final List<String> staffs, supervisors, admins;

  CompanyModel({this.staffNo, this.comapanyName, this.reportFrequency, this.reportNo, 
  this.staffs, this.supervisors, this.admins});

   CompanyModel.fromData(Map<String, dynamic> data)
      : staffNo = data['staffNo'],
        comapanyName = data['comapanyName'],
        reportNo = data['reportNo'],
        staffs = data['staff'],
         supervisors = data['supervisors'],
         admins = data['admin'],
         reportFrequency = data['reportFrequency'];

   Map<String, dynamic> toJson() {
    return {
       'staffNo': staffNo,
       'comapanyName': comapanyName,
       'reportNo': reportNo,
       'staff': staffs,
       'supervisors': supervisors,
       'admin': admins,
       'reportFrequency' : reportFrequency
       };
  }

}