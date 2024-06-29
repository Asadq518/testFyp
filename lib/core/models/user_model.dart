class UserModel {
  String? username;
  String? password;
  String? email;
  String? date;
  String? id;
  String? token;

  UserModel(
      {this.username,
      this.password,
      this.email,
      this.date,
      this.id,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    date = json['date'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['date'] = date;
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}
