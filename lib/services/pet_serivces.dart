import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fyp/core/models/pet_model.dart';
import 'package:path/path.dart';

import 'dart:io';

class ProductService with ChangeNotifier {
  final Dio _dio = Dio();
  final String _apiURL1 = 'http://192.168.10.5:3005'; // Add the scheme

  Future<PetModel> postProduct(PetModel pet, List<File> images) async {
    try {
      List<MultipartFile> multipartImages = [];
      for (var image in images) {
        multipartImages.add(await MultipartFile.fromFile(image.path,
            filename: basename(image.path)));
      }

      FormData formData = FormData.fromMap({
        'title': pet.title,
        'description': pet.description,
        'price': pet.price,
        'age': pet.age,
        'breed': pet.breed,
        'vaccination': pet.vaccination,
        'images': multipartImages,
      });

      final response = await _dio.post(
        '$_apiURL1/api/products', // Use string interpolation to concatenate the base URL with the endpoint
        data: formData,
      );
      if (response.statusCode == 200) {
        // Product posted successfully
        if (kDebugMode) {
          print('Product posted successfully');
        }
        // Create and return a new PetModel object
        return PetModel(
            name: pet.name,
            price: pet.price,
            description: pet.description,
            age: pet.age,
            breed: pet.breed,
            vaccination: pet.vaccination,
            images: pet.images);
      } else {
        throw Exception('Failed to post product: ${response.statusMessage}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error posting product: $error');
      }
      throw Exception('Failed to post product');
    }
  }
}
