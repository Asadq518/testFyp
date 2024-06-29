class PetConsultationModel {
  String? email;
  String? id;
  String? mail;
  String? petName;
  String? hName;
  String? dName;
  String? location;
  String? category;
  String? image;
  List<String>? images;
  String? hours;
  String? doctors;
  String? number;
  String? descripations;
  String? fee;
  String? title;

  PetConsultationModel({
    this.email,
    this.mail,
    this.id,
    this.petName,
    this.hName,
    this.dName,
    this.location,
    this.category,
    this.image,
    this.descripations,
    this.doctors,
    this.fee,
    this.hours,
    this.images,
    this.number,
    this.title,
  });

  PetConsultationModel.fromJson(Map<String, dynamic> json) {
    petName = json['pet_name'];
    location = json['location'];
    category = json['category'];
    image = json['image'];
    images = json['images'];
    hours = json['hours'];
    doctors = json['doctors'];
    descripations = json['descripations'];
    fee = json['fee'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pet_name'] = petName;
    data['location'] = location;
    data['category'] = category;
    data['image'] = image;
    data['images'] = images;
    data['hours'] = hours;
    data['doctors'] = doctors;
    data['imadescripationsge'] = descripations;
    data['fee'] = fee;
    data['title'] = title;
    return data;
  }
}
