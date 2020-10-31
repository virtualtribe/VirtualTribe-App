class WalletHistoryModel{
   final String id, txtRef, amounts, type;//(Credited or debited)
   final String status, time, date, recipentAccountName,
    recipentBankName, recipentAccountNumber; // Status (Failed, Pending, Success)

WalletHistoryModel({this.id, this.txtRef, this.amounts, this.type, 
this.status, this.time, this.date,
 this.recipentAccountName, this.recipentBankName, this.recipentAccountNumber});

  WalletHistoryModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
       txtRef = data['txtRef'],
       amounts = data['amounts'],
       type = data['type'],
       status = data['status'],
      time = data['time'],
       date = data['date'],
       recipentAccountName = data['recipentAccountName'],
       recipentBankName = data['recipentBankName'],
       recipentAccountNumber = data['recipentAccountNumber'];


Map<String, dynamic> toJson() {
    return {
       'id': id,
       'txtRef': txtRef,
       'amounts': amounts,
       'type' : type,
       'status' : status,
       'time' : time,
       'date' : date,
       'recipentAccountName' : recipentAccountName,
       'recipentBankName' : recipentBankName,
       'recipentAccountNumber' : recipentAccountNumber,
       };
  }
}