class PetMaintenanceModel {
  String? petName;
  String? location;
  String? category;
  String? image;
  String? title;
  String? hours;
  String? appointments;
  List<String>? images;
  String? services;

  PetMaintenanceModel({
    this.petName,
    this.location,
    this.category,
    this.image,
    this.appointments,
    this.hours,
    this.services,
    this.title,
    this.images,
  });

  PetMaintenanceModel.fromJson(Map<String, dynamic> json) {
    petName = json['petName'];
    location = json['location'];
    category = json['category'];
    image = json['image'];
    appointments = json['appointments'];
    hours = json['hours'];
    services = json['services'];
    title = json['title'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['petName'] = petName;
    data['location'] = location;
    data['category'] = category;
    data['image'] = image;
    data['appointments'] = appointments;
    data['hours'] = hours;
    data['services'] = services;
    data['title'] = title;
    data['images'] = images;
    return data;
  }
}
