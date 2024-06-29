import 'package:fyp/core/dummy_data/enums.dart';

class CategoryModel {
  String? name;
  String? img;
  ServiceCategory? serviceCategory;

  CategoryModel({this.name, this.img, this.serviceCategory});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['img'] = img;
    return data;
  }
}
