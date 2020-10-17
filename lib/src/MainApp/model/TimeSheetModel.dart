class TimesheetsModel {
  String code;
  String error;
  List<Timesheets> timesheets;
  Pagination pagination;

  TimesheetsModel({this.code, this.error, this.timesheets, this.pagination});

  TimesheetsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    error = json['error'];
    if (json['timesheets'] != null) {
      timesheets = new List<Timesheets>();
      json['timesheets'].forEach((v) {
        timesheets.add(new Timesheets.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error'] = this.error;
    if (this.timesheets != null) {
      data['timesheets'] = this.timesheets.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class Timesheets {
  int id;
  bool paid;
  int userId;
  int organizationId;
  String status;
  int keyboard;
  int mouse;
  int overall;
  int tracked;
  String startDate;
  String stopDate;
  String approvedOn;
  int approvedById;
  bool locked;
  String createdAt;
  String updatedAt;

  Timesheets(
      {this.id,
      this.paid,
      this.userId,
      this.organizationId,
      this.status,
      this.keyboard,
      this.mouse,
      this.overall,
      this.tracked,
      this.startDate,
      this.stopDate,
      this.approvedOn,
      this.approvedById,
      this.locked,
      this.createdAt,
      this.updatedAt});

  Timesheets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paid = json['paid'];
    userId = json['user_id'];
    organizationId = json['organization_id'];
    status = json['status'];
    keyboard = json['keyboard'];
    mouse = json['mouse'];
    overall = json['overall'];
    tracked = json['tracked'];
    startDate = json['start_date'];
    stopDate = json['stop_date'];
    approvedOn = json['approved_on'];
    approvedById = json['approved_by_id'];
    locked = json['locked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paid'] = this.paid;
    data['user_id'] = this.userId;
    data['organization_id'] = this.organizationId;
    data['status'] = this.status;
    data['keyboard'] = this.keyboard;
    data['mouse'] = this.mouse;
    data['overall'] = this.overall;
    data['tracked'] = this.tracked;
    data['start_date'] = this.startDate;
    data['stop_date'] = this.stopDate;
    data['approved_on'] = this.approvedOn;
    data['approved_by_id'] = this.approvedById;
    data['locked'] = this.locked;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Pagination {
  int nextPageStartId;

  Pagination({this.nextPageStartId});

  Pagination.fromJson(Map<String, dynamic> json) {
    nextPageStartId = json['next_page_start_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next_page_start_id'] = this.nextPageStartId;
    return data;
  }
}
