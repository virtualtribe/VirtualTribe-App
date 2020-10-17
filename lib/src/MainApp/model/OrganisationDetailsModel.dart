class OrganisationDetailsModel {
  String code;
  String error;
  List<Organizations> organizations;

  OrganisationDetailsModel({this.code, this.error, this.organizations});

  OrganisationDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
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
    data['code'] = this.code;
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
  String status;
  String createdAt;
  String updatedAt;
  String inviteUrl;

  Organizations(
      {this.id,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.inviteUrl});

  Organizations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inviteUrl = json['invite_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['invite_url'] = this.inviteUrl;
    return data;
  }
}
