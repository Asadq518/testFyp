import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:fyp/core/models/pet_missing_model.dart';
import 'package:fyp/core/models/pet_model.dart';
import 'package:fyp/core/models/user_model.dart';
import 'package:fyp/shared_perefrences/shared_perefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/api_config.dart';
import '../../core/models/pet_medical_consultation_model.dart';

class PetProvider with ChangeNotifier {
  final Dio _dio = Dio();
  final String _apiURL1 = Config.apiURL1;

  List<PetModel> _pets = [];
  List<PetModel> get pets => _pets;
  List<PetModel> _mypets = [];
  List<PetModel> get mypets => _mypets;

  List<PetMissingModel> _missingpets = [];
  List<PetMissingModel> get missingpets => _missingpets;
  List<PetMissingModel> _missingMypets = [];
  List<PetMissingModel> get missingMypets => _missingMypets;

  List<PetConsultationModel> _hospitalpets = [];
  List<PetConsultationModel> get hospitalpets => _hospitalpets;
  List<PetConsultationModel> _hospitalMypets = [];
  List<PetConsultationModel> get hospitalMypets => _hospitalMypets;

  Future<List<PetModel>> fetchPets() async {
    try {
      final response = await _dio.get('$_apiURL1/api/products');
      final List<dynamic> responseData = response.data;
      _pets = responseData
          .map((pet) => PetModel(
                name: pet['name'],
                location: pet['location'],
                price: pet['price'],
                breed: pet['breed'],
                category: pet['category'],
                sex: pet['sex'],
                img: pet['img'],
                age: pet['age'],
                weight: pet['weight'],
                vaccination: pet['vaccination'],
                title: pet['title'],
                description: pet['description'],
                number: pet['number'],
                images: pet['imageUrl'] != null
                    ? pet['imageUrl'].cast<String>()
                    : [],
              ))
          .toList();
      print(_pets.length);
      notifyListeners();
      return _pets;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching pets: $error');
      }
      throw Exception('Failed to fetch pets');
    }
  }

  Future<List<PetModel>> fetchMyPets(String email) async {
    // print(email);
    try {
      final response = await _dio.get('$_apiURL1/api/products/$email');
      final List<dynamic> responseData = response.data;
      print(responseData);
      _mypets = responseData
          .map((pet) => PetModel(
                name: pet['name'],
                id: pet['_id'],
                location: pet['location'],
                price: pet['price'],
                breed: pet['breed'],
                category: pet['category'],
                sex: pet['sex'],
                img: pet['img'],
                age: pet['age'],
                weight: pet['weight'],
                vaccination: pet['vaccination'],
                title: pet['title'],
                description: pet['description'],
                number: pet['number'],
                images: pet['imageUrl'] != null
                    ? pet['imageUrl'].cast<String>()
                    : [],
              ))
          .toList();

      notifyListeners();
      return _pets;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching pets: $error');
      }
      throw Exception('Failed to fetch pets');
    }
  }

  Future<PetModel> addPet(PetModel pet) async {
    try {
      UserModel users = await UserPreferences().getUser();
      FormData form = FormData.fromMap({
        'name': pet.name,
        'location': pet.location,
        'price': pet.price,
        'breed': pet.breed,
        'category': pet.category,
        'age': pet.age,
        'weight': pet.weight,
        'sex': pet.sex,
        'vaccination': pet.vaccination,
        'longitude': pet.longitude,
        'latitude': pet.latitude,
        'title': pet.title,
        'description': pet.description,
        'onth': pet.month,
        'email': users.email,
        'number': pet.number
      });

      if (pet.images != null) {
        for (var image in pet.images!) {
          form.files.add(MapEntry("img", await MultipartFile.fromFile(image)));
        }
      }

      final response = await _dio.post(
        '$_apiURL1/api/products', // Use _apiURL1 as a variable
        data: form,
      );
      if (response.statusCode == 200) {
        // Pet added successfully
        fetchPets(); // Refresh the list of pets
        return pet; // Return the newly added pet
      } else {
        throw Exception('Failed to add pet');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error adding pet: $error');
      }
      throw Exception('Failed to add pet');
    }
  }

  Future<PetMissingModel> addPetMissing(PetMissingModel pet) async {
    try {
      UserModel users = await UserPreferences().getUser();
      FormData form = FormData.fromMap({
        'email': users.email,
        "name": pet.petName,
        "category": pet.category,
        "age": pet.age,
        "weight": pet.weight,
        "breed": pet.breed,
        "sex": pet.sex,
        "seentime": pet.lseen,
        "area": pet.location,
        "number": pet.number,
        "mail": pet.mail,
      });

      if (pet.images != null) {
        for (var image in pet.images!) {
          form.files.add(MapEntry("img", await MultipartFile.fromFile(image)));
        }
      }

      final response = await _dio.post(
        '$_apiURL1/api/missings', // Use _apiURL1 as a variable
        data: form,
      );
      if (response.statusCode == 200) {
        // Pet added successfully
        fetchMissingPets();
        return pet;
      } else {
        throw Exception('Failed to add pet');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error adding pet: $error');
      }
      throw Exception('Failed to add pet');
    }
  }

  Future<List<PetMissingModel>> fetchMissingPets() async {
    try {
      final response = await _dio.get('$_apiURL1/api/missings');
      final List<dynamic> responseData = response.data;
      _missingpets = responseData
          .map((pet) => PetMissingModel(
                email: pet['email'],
                status: 'Active',
                images: pet['imageUrl'] != null
                    ? pet['imageUrl'].cast<String>()
                    : [],
                petName: pet['name'],
                category: pet['category'],
                age: pet['age'],
                weight: pet['weight'],
                breed: pet['breed'],
                sex: pet['sex'],
                lseen: pet['seentime'],
                number: pet['number'],
                location: pet['area'],
                mail: pet['mail'],
              ))
          .toList();
      print(_missingpets.length);
      notifyListeners();
      return _missingpets;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching pets: $error');
      }
      throw Exception('Failed to fetch pets');
    }
  }

  Future<List<PetMissingModel>> fetchMyMissingPets(String email) async {
    try {
      print('fetchMyMissingPets');
      print('$_apiURL1/api/missings/$email');
      final response = await _dio.get('$_apiURL1/api/missings/$email');
      final List<dynamic> responseData = response.data;
      _missingMypets = responseData
          .map((pet) => PetMissingModel(
                email: pet['email'],
                status: 'Active',
                id: pet['_id'],
                images: pet['imageUrl'] != null
                    ? pet['imageUrl'].cast<String>()
                    : [],
                petName: pet['name'],
                category: pet['category'],
                age: pet['age'],
                weight: pet['weight'],
                breed: pet['breed'],
                sex: pet['sex'],
                lseen: pet['seentime'],
                number: pet['number'],
                location: pet['area'],
                mail: pet['mail'],
              ))
          .toList();
      print(_missingpets.length);
      notifyListeners();
      return _missingpets;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching pets: $error');
      }
      throw Exception('Failed to fetch pets');
    }
  }

  Future<PetConsultationModel> addPetHospital(PetConsultationModel pet) async {
    try {
      UserModel users = await UserPreferences().getUser();
      FormData form = FormData.fromMap({
        "email": users.email,
        "name": pet.hName,
        "category": pet.category,
        "area": pet.location,
        "fee": pet.fee,
        "hours": "9AM - 10PM",
        "doctorname": pet.dName,
        "number": pet.number,
        "mail": pet.mail,
      });

      if (pet.images != null) {
        for (var image in pet.images!) {
          form.files.add(MapEntry("img", await MultipartFile.fromFile(image)));
        }
      }

      final response = await _dio.post(
        '$_apiURL1/api/hospitals', // Use _apiURL1 as a variable
        data: form,
      );
      if (response.statusCode == 200) {
        // Pet added successfully
        fetchMissingPets();
        return pet;
      } else {
        throw Exception('Failed to add hospital');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error adding pet: $error');
      }
      throw Exception('Failed to add hospital');
    }
  }

  Future<List<PetConsultationModel>> fetchMyHospitalPets(String email) async {
    try {
      final response = await _dio.get('$_apiURL1/api/hospitals/$email');
      final List<dynamic> responseData = response.data;
      _hospitalMypets = responseData
          .map((pet) => PetConsultationModel(
                email: pet['email'],
                id: pet['_id'],
              
                images: pet['imageUrl'] != null
                    ? pet['imageUrl'].cast<String>()
                    : [],

                petName: pet['name'],
                hName: pet['name'],
                dName: pet['doctorname'],
                doctors: pet['doctorname'],
                category: pet['category'],
                location: pet['area'],
                fee: pet['fee'],
                hours: pet['hours'],

                number: pet['number'],
                mail: pet['mail'],
              ))
          .toList();

      notifyListeners();
      return _hospitalpets;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching pets: $error');
      }
      throw Exception('Failed to fetch pets');
    }
  }
  
  Future<List<PetConsultationModel>> fetchHospitalPets() async {
    try {
      final response = await _dio.get('$_apiURL1/api/hospitals');
      final List<dynamic> responseData = response.data;
      _hospitalpets = responseData
          .map((pet) => PetConsultationModel(
                email: pet['email'],
                images: pet['imageUrl'] != null
                    ? pet['imageUrl'].cast<String>()
                    : [],

                petName: pet['name'],
                hName: pet['name'],
                dName: pet['doctorname'],
                doctors: pet['doctorname'],
                category: pet['category'],
                location: pet['area'],
                fee: pet['fee'],
                hours: pet['hours'],

                number: pet['number'],
                mail: pet['mail'],
              ))
          .toList();

      notifyListeners();
      return _hospitalpets;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching pets: $error');
      }
      throw Exception('Failed to fetch pets');
    }
  }

}
