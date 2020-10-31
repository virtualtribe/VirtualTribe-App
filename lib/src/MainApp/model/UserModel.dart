class UserModel{
  final String id, email, type, fullName, phoneNumber, 
  phoneCode, accountNumber, bankName, accountName, homeAddress,
   guarantorName, guarantorNumber, nameOfNextKinController, nameOfNextKinPhoneNumberController, dateOfBirth, walletBalance;

  UserModel({this.id, this.email, this.type, this.fullName,    this.phoneNumber, this.phoneCode, this.accountNumber, this.bankName, this.accountName, this.homeAddress,
   this.guarantorName,  this.guarantorNumber,  this.nameOfNextKinController,  this.nameOfNextKinPhoneNumberController, this.dateOfBirth, this.walletBalance});

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
       email = data['email'],
       type = data['type'],
       fullName = data['fullName'],
       phoneNumber = data['phoneNumber'],
        dateOfBirth = data['dateOfBirth'],
       phoneCode = data['phoneCode'],
       accountNumber = data['accountNumber'],
       bankName = data['bankName'],
       homeAddress = data['homeAddress'],
       accountName = data['accountName'],
        guarantorName = data['guarantorName'],
         guarantorNumber = data['guarantorNumber'],
          nameOfNextKinController = data['nameOfNextKinController'],
           nameOfNextKinPhoneNumberController = data['nameOfNextKinPhoneNumberController'],
           walletBalance = data['walletBalance'];

  Map<String, dynamic> toJson() {
    return {
       'id': id,
       'email': email,
       'type': type,
       'fullName' : fullName,
       'phoneNumber' : phoneNumber,
       'dateOfBirth' : dateOfBirth,
       'phoneCode' : phoneCode,
       'accountNumber' : accountNumber,
       'bankName' : bankName,
       'homeAddress' : homeAddress,
       'accountName' : accountName,
        'guarantorName' : guarantorName,
         'guarantorNumber' : guarantorNumber,
          'nameOfNextKinController' : nameOfNextKinController,
           'nameOfNextKinPhoneNumberController' : nameOfNextKinPhoneNumberController,
            'walletBalance' : walletBalance
       };
  }

}