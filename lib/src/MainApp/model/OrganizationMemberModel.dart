class OrganizationMemberModel {
  String code;
  String error;
  List<Members> members;

  OrganizationMemberModel({this.code, this.error, this.members});

  OrganizationMemberModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    error = json['error'];
    if (json['members'] != null) {
      members = new List<Members>();
      json['members'].forEach((v) {
        members.add(new Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error'] = this.error;
    if (this.members != null) {
      data['members'] = this.members.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  int userId;
  String currency;
  String membershipRole;
  String membershipStatus;
  String createdAt;
  String updatedAt;
  String lastClientActivity;
  List<ProjectMembers> projectMembers;
  String payPeriod;
  bool trackable;

  Members(
      {this.userId,
      this.currency,
      this.membershipRole,
      this.membershipStatus,
      this.createdAt,
      this.updatedAt,
      this.lastClientActivity,
      this.projectMembers,
      this.payPeriod,
      this.trackable});

  Members.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    currency = json['currency'];
    membershipRole = json['membership_role'];
    membershipStatus = json['membership_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastClientActivity = json['last_client_activity'];
    if (json['project_members'] != null) {
      projectMembers = new List<ProjectMembers>();
      json['project_members'].forEach((v) {
        projectMembers.add(new ProjectMembers.fromJson(v));
      });
    }
    payPeriod = json['pay_period'];
    trackable = json['trackable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['currency'] = this.currency;
    data['membership_role'] = this.membershipRole;
    data['membership_status'] = this.membershipStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_client_activity'] = this.lastClientActivity;
    if (this.projectMembers != null) {
      data['project_members'] =
          this.projectMembers.map((v) => v.toJson()).toList();
    }
    data['pay_period'] = this.payPeriod;
    data['trackable'] = this.trackable;
    return data;
  }
}

class ProjectMembers {
  String currency;
  String membershipRole;
  String membershipStatus;
  String createdAt;
  String updatedAt;
  String lastClientActivity;
  int projectId;

  ProjectMembers(
      {this.currency,
      this.membershipRole,
      this.membershipStatus,
      this.createdAt,
      this.updatedAt,
      this.lastClientActivity,
      this.projectId});

  ProjectMembers.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    membershipRole = json['membership_role'];
    membershipStatus = json['membership_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastClientActivity = json['last_client_activity'];
    projectId = json['project_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['membership_role'] = this.membershipRole;
    data['membership_status'] = this.membershipStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_client_activity'] = this.lastClientActivity;
    data['project_id'] = this.projectId;
    return data;
  }
}
