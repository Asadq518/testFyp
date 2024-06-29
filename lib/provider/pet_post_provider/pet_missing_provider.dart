// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:fyp/core/models/pet_missing_model.dart';

// class PetMissingProvider with ChangeNotifier {
//   final Dio _dio = Dio();
//   final String _apiURL1 = 'http://192.168.10.5:3005'; // Add the scheme

//   List<PetMissingModel> _petMissingList = [];
//   List<PetMissingModel> get petMissingList => _petMissingList;

//   Future<List<PetMissingModel>> fetchPetMissingList() async {
//     try {
//       final response = await _dio.get('$_apiURL1/api/pet_missing');
//       final List<dynamic> responseData = response.data;
//       _petMissingList = responseData
//           .map((petMissing) => PetMissingModel.fromJson(petMissing))
//           .toList();
//       print(_petMissingList.length);
//       notifyListeners();
//       return _petMissingList;
//     } catch (error) {
//       if (kDebugMode) {
//         print('Error fetching pet missing list: $error');
//       }
//       throw Exception('Failed to fetch pet missing list');
//     }
//   }

//   Future<PetMissingModel> addPetMissing(PetMissingModel petMissing) async {
//     try {
//       FormData form = FormData.fromMap({
//         'pet_name': petMissing.petName,
//         'category': petMissing.category,
//         'breed': petMissing.breed,
//         'location': petMissing.location,
//         'pet_image': petMissing.petImage,
//         'tatus': petMissing.status,
//         'age': petMissing.age,
//         'weight': petMissing.weight,
//         'ex': petMissing.sex,
//         'images': petMissing.images,
//         'lastseen': petMissing.lastseen.toString(),
//       });

//       if (petMissing.images != null) {
//         for (var image in petMissing.images!) {
//           form.files.add(MapEntry("img", await MultipartFile.fromFile(image)));
//         }
//       }
//       final response = await _dio.post(
//         '$_apiURL1/api/pet_missing', // Use _apiURL1 as a variable
//         data: form,
//       );
//       if (response.statusCode == 200) {
//         // Pet missing added successfully
//         fetchPetMissingList(); // Refresh the list of pet missing
//         return petMissing; // Return the newly added pet missing
//       } else {
//         throw Exception('Failed to add pet missing');
//       }
//     } catch (error) {
//       if (kDebugMode) {
//         print('Error adding pet missing: $error');
//       }
//       throw Exception('Failed to add pet missing');
//     }
//   }

//   @override
//   void notifyListeners() {}
// }
