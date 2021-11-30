class Login {
  String email;
  String password;

  Login({this.email, this.password});

  Login.fromJson(Map<String, dynamic> json) {
    if (json["email"] is String) this.email = json["email"];
    if (json["password"] is String) this.password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}
