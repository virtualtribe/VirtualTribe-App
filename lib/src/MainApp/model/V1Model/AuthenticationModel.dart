class AuthenticationModel {
  String error;
  User user;

  AuthenticationModel({this.error, this.user});

  AuthenticationModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String lastActivity;
  String authToken;

  User({this.id, this.name, this.lastActivity, this.authToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastActivity = json['last_activity'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_activity'] = this.lastActivity;
    data['auth_token'] = this.authToken;
    return data;
  }
}
