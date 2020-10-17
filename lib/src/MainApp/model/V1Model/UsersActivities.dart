class UsersActivities {
  String error;
  List<Activities> activities;

  UsersActivities({this.error, this.activities});

  UsersActivities.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['activities'] != null) {
      activities = new List<Activities>();
      json['activities'].forEach((v) {
        activities.add(new Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.activities != null) {
      data['activities'] = this.activities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
  int id;
  String timeSlot;
  String startsAt;
  int userId;
  int projectId;
  int taskId;
  int keyboard;
  int mouse;
  int overall;
  int tracked;
  bool paid;

  Activities(
      {this.id,
      this.timeSlot,
      this.startsAt,
      this.userId,
      this.projectId,
      this.taskId,
      this.keyboard,
      this.mouse,
      this.overall,
      this.tracked,
      this.paid});

  Activities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeSlot = json['time_slot'];
    startsAt = json['starts_at'];
    userId = json['user_id'];
    projectId = json['project_id'];
    taskId = json['task_id'];
    keyboard = json['keyboard'];
    mouse = json['mouse'];
    overall = json['overall'];
    tracked = json['tracked'];
    paid = json['paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time_slot'] = this.timeSlot;
    data['starts_at'] = this.startsAt;
    data['user_id'] = this.userId;
    data['project_id'] = this.projectId;
    data['task_id'] = this.taskId;
    data['keyboard'] = this.keyboard;
    data['mouse'] = this.mouse;
    data['overall'] = this.overall;
    data['tracked'] = this.tracked;
    data['paid'] = this.paid;
    return data;
  }
}
