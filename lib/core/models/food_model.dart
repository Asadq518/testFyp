class FoodModel {
  String? foodName;
  String? category;
  String? foodImage;
  int? price;
  String? desperciption;

  FoodModel(
      {this.foodName,
      this.category,
      this.foodImage,
      this.price,
      this.desperciption});

  FoodModel.fromJson(Map<String, dynamic> json) {
    foodName = json['Food_name'];
    category = json['category'];
    foodImage = json['food_image'];
    price = json['price'];
    desperciption = json["desperciption"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Food_name'] = foodName;
    data['category'] = category;
    data['food_image'] = foodImage;
    data['price'] = price;
    data["desperciption"] = desperciption;
    return data;
  }
}
