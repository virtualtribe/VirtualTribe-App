class AddStaffByAdminModel{
  final String  email, role, supervisor, management; 

AddStaffByAdminModel({this.email, this.role, this.supervisor, this.management});

AddStaffByAdminModel.fromData(Map<String, dynamic> data)
      : email = data['email'],
       role = data['role'],
       supervisor = data['supervisor'],
       management = data['management'];

  Map<String, dynamic> toJson() {
    return {
       'email': email,
       'role': role,
       'supervisor': supervisor,
       'management': management
       };
  }

}