class UserModel {
  String email;
  String uid;
  String role;

  UserModel({String email, String uid, String role = "MEMBER"}) {
    this.email = email;
    this.uid = uid;
    this.role = role;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    uid = json['uid'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['uid'] = this.uid;
    data['role'] = this.role;
    return data;
  }
}
