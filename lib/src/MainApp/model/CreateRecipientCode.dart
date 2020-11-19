class CreateRecipientCode {
  bool status;
  String message;
  Data data;

  CreateRecipientCode({this.status, this.message, this.data});

  CreateRecipientCode.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  bool active;
  String createdAt;
  String currency;
  Null description;
  String domain;
  Null email;
  int id;
  int integration;
  Null metadata;
  String name;
  String recipientCode;
  String type;
  String updatedAt;
  bool isDeleted;
  Details details;

  Data(
      {this.active,
        this.createdAt,
        this.currency,
        this.description,
        this.domain,
        this.email,
        this.id,
        this.integration,
        this.metadata,
        this.name,
        this.recipientCode,
        this.type,
        this.updatedAt,
        this.isDeleted,
        this.details});

  Data.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['createdAt'];
    currency = json['currency'];
    description = json['description'];
    domain = json['domain'];
    email = json['email'];
    id = json['id'];
    integration = json['integration'];
    metadata = json['metadata'];
    name = json['name'];
    recipientCode = json['recipient_code'];
    type = json['type'];
    updatedAt = json['updatedAt'];
    isDeleted = json['is_deleted'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['domain'] = this.domain;
    data['email'] = this.email;
    data['id'] = this.id;
    data['integration'] = this.integration;
    data['metadata'] = this.metadata;
    data['name'] = this.name;
    data['recipient_code'] = this.recipientCode;
    data['type'] = this.type;
    data['updatedAt'] = this.updatedAt;
    data['is_deleted'] = this.isDeleted;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class Details {
  Null authorizationCode;
  String accountNumber;
  Null accountName;
  String bankCode;
  String bankName;

  Details(
      {this.authorizationCode,
        this.accountNumber,
        this.accountName,
        this.bankCode,
        this.bankName});

  Details.fromJson(Map<String, dynamic> json) {
    authorizationCode = json['authorization_code'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    bankCode = json['bank_code'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization_code'] = this.authorizationCode;
    data['account_number'] = this.accountNumber;
    data['account_name'] = this.accountName;
    data['bank_code'] = this.bankCode;
    data['bank_name'] = this.bankName;
    return data;
  }
}
