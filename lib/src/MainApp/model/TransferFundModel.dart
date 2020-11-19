class TransferFundModel {
  bool status;
  String message;
  Data data;

  TransferFundModel({this.status, this.message, this.data});

  TransferFundModel.fromJson(Map<String, dynamic> json) {
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
  String reference;
  int integration;
  String domain;
  int amount;
  String currency;
  String source;
  String reason;
  int recipient;
  String status;
  String transferCode;
  int id;
  String createdAt;
  String updatedAt;

  Data(
      {this.reference,
        this.integration,
        this.domain,
        this.amount,
        this.currency,
        this.source,
        this.reason,
        this.recipient,
        this.status,
        this.transferCode,
        this.id,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    integration = json['integration'];
    domain = json['domain'];
    amount = json['amount'];
    currency = json['currency'];
    source = json['source'];
    reason = json['reason'];
    recipient = json['recipient'];
    status = json['status'];
    transferCode = json['transfer_code'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    data['integration'] = this.integration;
    data['domain'] = this.domain;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['source'] = this.source;
    data['reason'] = this.reason;
    data['recipient'] = this.recipient;
    data['status'] = this.status;
    data['transfer_code'] = this.transferCode;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
