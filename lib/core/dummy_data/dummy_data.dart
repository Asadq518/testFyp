import 'package:fyp/core/dummy_data/enums.dart';
import 'package:fyp/core/models/category_model.dart';
import 'package:fyp/core/models/chat_model.dart';
import 'package:fyp/core/models/food_model.dart';
import 'package:fyp/core/models/pet_maintenance_model.dart';
import 'package:fyp/core/models/pet_medical_consultation_model.dart';
import 'package:fyp/core/models/pet_missing_model.dart';
import 'package:fyp/core/models/pet_model.dart';

class DummyData {
  static List<CategoryModel> categories = [
    CategoryModel(
      name: 'SELL',
      serviceCategory: ServiceCategory.sell,
      img: 'assets/images/sell.png',
    ),
    CategoryModel(
      name: 'FOOD',
      serviceCategory: ServiceCategory.food,
      img: 'assets/images/FOOD.png',
    ),
    CategoryModel(
      name: 'Maintenance',
      serviceCategory: ServiceCategory.maintenance,
      img: 'assets/images/Maintenance.png',
    ),
    CategoryModel(
      name: 'LOST PET',
      serviceCategory: ServiceCategory.petloss,
      img: 'assets/images/LOST PET.png',
    ),
    CategoryModel(
      name: 'Medical',
      serviceCategory: ServiceCategory.medical,
      img: 'assets/images/Medical.png',
    )
  ];
  static List<PetModel> pets = [
    PetModel(
      name: "Shiba Inu",
      location: "Johar Town",
      price: 150000,
      breed: 'persion',
      img: 'assets/images/pet1.png',
      images: ['assets/images/pet1.png'],
      age: '8',
      weight: "10",
      sex: "MALE",
      category: "Cats",
      description:
          "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
      title: "About Shiba Inu",
      vaccination: "No",
      month: "6",
    ),
    PetModel(
      name: "Bernedoodle",
      location: "Johar Town",
      price: 10000,
      breed: 'persion',
      img: 'assets/images/Pet2.png',
      images: ['assets/images/Pet2.png'],
      category: "Dogs",
      description:
          "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
      title: "About Bernedoodle ",
      age: '8',
      weight: "10",
      sex: "MALE",
      vaccination: "Yes",
      month: "6",
    ),
    PetModel(
        name: "Luna Female Dog",
        location: "Johar Town",
        price: 120000,
        breed: 'persion',
        img: 'assets/images/Pet3.png',
        images: ['assets/images/Pet3.png'],
        category: "Dogs",
        description:
            "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
        title: "About Luna Female Dog",
        age: '8',
        weight: "10",
        sex: "MALE",
        vaccination: "Yes",
        month: "6"),
    PetModel(
        name: "Coco",
        location: "Johar Town",
        price: 150000,
        breed: 'persion',
        img: 'assets/images/pet5.png',
        images: ['assets/images/pet5.png'],
        category: "Rabbits",
        description:
            "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
        title: "About Coco",
        age: '8',
        weight: "10",
        sex: "MALE",
        vaccination: "No",
        month: "6"),
    PetModel(
        name: "Bella Dog",
        location: "Johar Town",
        price: 150000,
        breed: 'persion',
        category: "Rabbits",
        img: 'assets/images/pet6.png',
        images: ['assets/images/pet6.png'],
        description:
            "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
        title: "About Bella Dog",
        age: '8',
        weight: "10",
        sex: "MALE",
        vaccination: "No",
        month: "6")
  ];
  static List<FoodModel> food = [
    FoodModel(
      foodName: "Kitten food ",
      category: "Cats",
      price: 15000,
      foodImage: "assets/images/food1.png",
      desperciption:
          "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
    ),
    FoodModel(
      foodName: "WOO FIN GOOD",
      category: "Dogs",
      price: 1000,
      foodImage: "assets/images/food2.png",
      desperciption:
          "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
    ),
    FoodModel(
      foodName: "Saggy ",
      category: "Dogs",
      price: 3000,
      foodImage: "assets/images/food3.png",
      desperciption:
          "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
    ),
    FoodModel(
      foodName: "selective jr",
      category: "Dogs",
      price: 5000,
      foodImage: "assets/images/food4.png",
      desperciption:
          "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
    ),
    FoodModel(
      foodName: "Watson ",
      category: "Dogs",
      price: 1500,
      foodImage: "assets/images/food5.png",
      desperciption:
          "The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
    ),
  ];

  static List<PetMissingModel> missing = [
    PetMissingModel(
        petName: "Charlie",
        category: "Dogs",
        location: "Johar Town",
        status: "Missing",
        breed: "persion",
        images: ["assets/images/M1.png"],
        petImage: "assets/images/M1.png",
        age: 'month 8',
        weight: "10",
        sex: "MALE",
        lastseen: DateTime.parse('2024-01-20 14:54:54.052')),
    PetMissingModel(
        petName: "2Charlie",
        category: "Dogs",
        location: "Johar Town",
        status: "Missing",
        breed: "persion",
        images: ["assets/images/M2.png"],
        petImage: "assets/images/M2.png",
        age: 'month 8',
        weight: "10",
        sex: "MALE",
        lastseen: DateTime.parse('2024-01-20 14:54:54.052')),
    PetMissingModel(
        petName: "3Charlie",
        category: "Rabbits",
        location: "Johar Town",
        status: "Missing",
        breed: "persion",
        images: ["assets/images/M3.png"],
        petImage: "assets/images/M3.png",
        age: 'month 8',
        weight: "10",
        sex: "MALE",
        lastseen: DateTime.parse('2024-01-20 14:54:54.052')),
    PetMissingModel(
        petName: "4Charlie",
        category: "Dogs",
        location: "Johar Town",
        status: "Missing",
        breed: "persion",
        images: ["assets/images/M4.png"],
        petImage: "assets/images/M4.png",
        age: 'month 8',
        weight: "10",
        sex: "MALE",
        lastseen: DateTime.parse('2024-01-20 14:54:54.052')),
    PetMissingModel(
        petName: "5Charlie",
        category: "Cats",
        location: "Johar Town",
        status: "Missing",
        breed: "persion",
        images: ["assets/images/M5.png"],
        petImage: "assets/images/M5.png",
        age: 'month 8',
        weight: "10",
        sex: "MALE",
        lastseen: DateTime.parse('2024-01-20 14:54:54.052')),
  ];

  static List<PetMaintenanceModel> maitenance = [
    PetMaintenanceModel(
        petName: "Fifi & Fido’s Fabulous Salon",
        location: "Johar Town",
        images: ["assets/images/Mi1.png"],
        image: "assets/images/Mi1.png",
        category: "Dogs",
        hours: "9AM - 10PM",
        services: "Cutting",
        appointments: "Open",
        title: "About Fifi & Fido’s Fabulous"),
    PetMaintenanceModel(
        petName: "Happypet Grooming Service",
        location: "Johar Town ",
        images: ["assets/images/Mi2.png"],
        image: "assets/images/Mi2.png",
        category: "Cats",
        hours: "9AM - 10PM",
        services: "Cutting",
        appointments: "Open",
        title: "About Happypet Grooming Service"),
    PetMaintenanceModel(
      petName: "This Little Piggy  The Groomer’s",
      location: "Johar Town",
      images: ["assets/images/Mi3.png"],
      image: "assets/images/Mi3.png",
      category: "Rabbits",
      hours: "9AM - 10PM",
      services: "Cutting",
      appointments: "Closed",
      title: "About This Little Piggy",
    ),
    PetMaintenanceModel(
        petName: "Paw-some Pooch Parlor",
        location: "Johar Town ",
        images: ["assets/images/Mi4.png"],
        image: "assets/images/Mi4.png",
        category: "Dogs",
        hours: "9AM - 10PM",
        services: "Cutting",
        appointments: "Closed",
        title: "About Paw-some Pooch Parlor"),
    PetMaintenanceModel(
      petName: "Snuggle Pups Spa",
      location: "Johar Town",
      images: ['"assets/images/Mi5.png"'],
      image: "assets/images/Mi5.png",
      category: "Cats",
      hours: "9AM - 10PM",
      services: "Cutting",
      appointments: "Closed",
      title: "AboutSnuggle Pups Spa",
    ),
  ];
  static List<PetConsultationModel> consultation = [
    PetConsultationModel(
        petName: "Modern Pets Hospital",
        location: "Johar Town",
        image: "assets/images/c1.png",
        images: ["assets/images/c1.png"],
        category: "Cats",
        fee: "1500",
        hours: "9AM - 10PM",
        descripations:
            "  The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
        doctors: "Dr Abdullah",
        title: "About KM Pets Hospital "),
    PetConsultationModel(
        petName: "Petxpress Veterinary Hospital",
        location: "Johar Town",
        image: "assets/images/c2.png",
        images: ["assets/images/c2.png"],
        category: "Dogs",
        fee: "1500",
        hours: "9AM - 10PM",
        descripations:
            "  The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
        doctors: "Dr Abdullah",
        title: "About KM Pets Hospital "),
    PetConsultationModel(
        petName: "KM Pets Hospital",
        location: "Johar Town",
        image: "assets/images/c3.png",
        images: ["assets/images/c3.png"],
        category: "Rabbits",
        fee: "1500",
        hours: "9AM - 10PM",
        descripations:
            "  The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
        doctors: "Dr Abdullah",
        title: "About KM Pets Hospital "),
    PetConsultationModel(
        petName: "Pet City Animal Hospital",
        location: "Johar Town",
        image: "assets/images/c4.png",
        images: ["assets/images/c4.png"],
        category: "Cats",
        fee: "1500",
        hours: "9AM - 10PM",
        descripations:
            "  The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
        doctors: "Dr Abdullah",
        title: "About Pet City Animal "),
    PetConsultationModel(
        petName: "City Vets Pet Clinic & Mart",
        location: "Johar Town",
        image: "assets/images/c5.png",
        images: ["assets/images/c5.png"],
        category: "Dogs",
        fee: "1500",
        hours: "9AM - 10PM",
        descripations:
            "  The British Shorthair Peki Female Tetra Coat Blue Eyes Peke Bloodline Piki Female Kitten Age 8 Months Very Active Mashallah Attractive Blue Eyes Very Playful Very Cute Face Female Looking for a new home.Girls or Lady New Owner will be Preferred. Selling due transfer.Her Teenage pic is also Attached.Both friends cats for Sale.Who will buy both will be Discounted InshallahAvoid Bogus Offers No Thirds Parties or Dealers",
        doctors: "Dr Abdullah",
        title: "About City Vets Pet Clinic "),
  ];

  static List<ChatModel> chat = [
    ChatModel(
      name: "Abdu R Rehman",
      image: "assets/svg/emoji.svg",
    ),
    ChatModel(
      name: "Abdullah",
      image: "assets/svg/emoji.svg",
    ),
    ChatModel(
      name: "Ubaid",
      image: "assets/svg/emoji.svg",
    ),
  ];
}
