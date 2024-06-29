import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  bool isLightModeEnabled = false;
  File? _pickedImageFile;
  String? _pickedImagePath; // Store the image file path
  String userName = 'Username';
  String fullName = 'Alpha ChatBot';
  String emailAddress = 'email@xyz.com';

  AppSettings() {
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    isLightModeEnabled = prefs.getBool('isLightModeEnabled') ?? false;
    userName = prefs.getString('userName') ?? 'Username';
    fullName = prefs.getString('fullName') ?? 'Alpha ChatBot';
    emailAddress = prefs.getString('emailAddress') ?? 'email@xyz.com';
    _pickedImagePath =
        prefs.getString('pickedImagePath'); // Load the image path
    if (_pickedImagePath != null) {
      _pickedImageFile = File(_pickedImagePath!);
    }
    notifyListeners();
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLightModeEnabled', isLightModeEnabled);
    prefs.setString('userName', userName);
    prefs.setString('fullName', fullName);
    prefs.setString('emailAddress', emailAddress);
    prefs.setString('pickedImagePath',
        _pickedImagePath ?? 'assets/images/profile.png'); // Save the image path
  }

  void setDarkModeEnabled(bool value) {
    isLightModeEnabled =
        value ? isLightModeEnabled == false : isLightModeEnabled == true;
    _saveData();
    notifyListeners();
  }

  File? get pickedImage => _pickedImageFile;

  Future<void> setImage(File image) async {
    _pickedImageFile = image;
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/profile_image.png';
    await image.copy(imagePath);
    _pickedImagePath = imagePath;
    _saveData();
    notifyListeners();
  }

  String get selectedFirstName => userName;
  void setFirstName(String name) {
    userName = name;
    _saveData();
    notifyListeners();
  }

  String get selectedLastName => fullName;

  void setLastName(String name) {
    fullName = name;
    _saveData();
    notifyListeners();
  }

  String get selectedEmailAddress => emailAddress;

  void setEmailAddress(String name) {
    emailAddress = name;
    _saveData();
    notifyListeners();
  }
}
