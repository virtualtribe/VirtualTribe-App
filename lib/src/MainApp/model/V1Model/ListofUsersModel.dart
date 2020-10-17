class ListofUsersModel {
  String error;
  List<Users> users;

  ListofUsersModel({this.error, this.users});

  ListofUsersModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['users'] != null) {
      users = new List<Users>();
      json['users'].forEach((v) {
        users.add(new Users.fromJson(v));
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

class Users {
  int id;
  String name;
  String lastActivity;
  String email;

  Users({this.id, this.name, this.lastActivity, this.email});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastActivity = json['last_activity'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_activity'] = this.lastActivity;
    data['email'] = this.email;
    return data;
  }
}
