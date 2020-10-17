class WeeklyTimesheetModel {
  String error;
  List<Organizations> organizations;

  WeeklyTimesheetModel({this.error, this.organizations});

  WeeklyTimesheetModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['organizations'] != null) {
      organizations = new List<Organizations>();
      json['organizations'].forEach((v) {
        organizations.add(new Organizations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.organizations != null) {
      data['organizations'] =
          this.organizations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organizations {
  int id;
  String name;
  int duration;
  List<Users> users;

  Organizations({this.id, this.name, this.duration, this.users});

  Organizations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    if (json['users'] != null) {
      users = new List<Users>();
      json['users'].forEach((v) {
        users.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int id;
  String name;
  int duration;
  List<Dates> dates;

  Users({this.id, this.name, this.duration, this.dates});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    if (json['dates'] != null) {
      dates = new List<Dates>();
      json['dates'].forEach((v) {
        dates.add(new Dates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    if (this.dates != null) {
      data['dates'] = this.dates.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dates {
  String date;
  int duration;

  Dates({this.date, this.duration});

  Dates.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['duration'] = this.duration;
    return data;
  }
}