class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phNo;
  String? password;

  User({this.firstName, this.lastName, this.email, this.phNo, this.password});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phNo = json['phNo'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phNo'] = this.phNo;
    data['password'] = this.password;
    return data;
  }
}
