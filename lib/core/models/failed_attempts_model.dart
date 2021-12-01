class Failed {
  bool success;
  String message;

  Failed({this.success, this.message});

  Failed.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) this.success = json["success"];
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["success"] = this.success;
    data["message"] = this.message;
    return data;
  }
}
