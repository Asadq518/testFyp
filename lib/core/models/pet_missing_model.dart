class PetMissingModel {
  String? petImage;
  String? id;
  String? category;
  DateTime? lastseen;
  String? lseen;
  String? breed;
  String? sex;
  String? age;
  String? weight;
  String? location;

  String? petName;
  String? number;
  String? email;
  String? status;
  String? mail;
  List<String>? images;

  PetMissingModel({
    this.petName,
    this.id,
    this.category,
    this.breed,
    this.location,
    this.petImage,
    this.status,
    this.age,
    this.sex,
    this.weight,
    this.images,
    this.lastseen,
    this.email,
    this.number,
    this.mail,
    this.lseen,
  });
 
  PetMissingModel.fromJson(Map<String, dynamic> json) {
    petName = json['pet_name'];
    category = json['category'];
    breed = json['breed'];
    location = json['location'];
    petImage = json['pet_image'];
    status = json['status'];
    age = json['age'];
    weight = json['weight'];
    sex = json['sex'];
    images = json['images'];
    number = json['images'];
    email = json['images'];
    lastseen = json["lastseen"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pet_name'] = petName;
    data['category'] = category;
    data['breed'] = breed;
    data['location'] = location;
    data['pet_image'] = petImage;
    data['status'] = status;
    data['age'] = age;
    data['weight'] = weight;
    data['sex'] = sex;
    data['images'] = images;
    data["lastseen"] = lastseen;
    return data;
  }
}
