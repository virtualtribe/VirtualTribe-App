class MembersModel {
  List<MemberUsers> users;
  String error;

  MembersModel({this.users});

  MembersModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['users'] != null) {
      users = new List<MemberUsers>();
      json['users'].forEach((v) {
        users.add(new MemberUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberUsers {
  int id;
  String name;
  String lastActivity;
  String email;
  String membershipStatus;

  MemberUsers(
      {this.id,
      this.name,
      this.lastActivity,
      this.email,
      this.membershipStatus});

  MemberUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastActivity = json['last_activity'];
    email = json['email'];
    membershipStatus = json['membership_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_activity'] = this.lastActivity;
    data['email'] = this.email;
    data['membership_status'] = this.membershipStatus;
    return data;
  }
}
