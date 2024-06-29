class ChatModel {
  String? name;
  String? image;

  ChatModel({this.name, this.image});

  ChatModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Image'] = image;
    return data;
  }
}
