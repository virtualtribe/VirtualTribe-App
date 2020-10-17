class FetchBankModel {
  bool status;
  String message;
  List<BankData> data;

  FetchBankModel({this.status, this.message, this.data});

  FetchBankModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<BankData>();
      json['data'].forEach((v) {
        data.add(new BankData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankData {
  String name;
  String slug;
  String code;
  String longcode;
  String gateway;
  bool payWithBank;
  bool active;
  bool isDeleted;
  String country;
  String currency;
  String type;
  int id;
  String createdAt;
  String updatedAt;

  BankData(
      {this.name,
      this.slug,
      this.code,
      this.longcode,
      this.gateway,
      this.payWithBank,
      this.active,
      this.isDeleted,
      this.country,
      this.currency,
      this.type,
      this.id,
      this.createdAt,
      this.updatedAt});

  BankData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    code = json['code'];
    longcode = json['longcode'];
    gateway = json['gateway'];
    payWithBank = json['pay_with_bank'];
    active = json['active'];
    isDeleted = json['is_deleted'];
    country = json['country'];
    currency = json['currency'];
    type = json['type'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['code'] = this.code;
    data['longcode'] = this.longcode;
    data['gateway'] = this.gateway;
    data['pay_with_bank'] = this.payWithBank;
    data['active'] = this.active;
    data['is_deleted'] = this.isDeleted;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['type'] = this.type;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
