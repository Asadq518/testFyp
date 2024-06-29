import 'package:flutter/foundation.dart';
import 'package:fyp/core/models/bot_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MessageProvider with ChangeNotifier {
  late Database _database;
  List<Message> _messages = [];

  MessageProvider() {
    _initDatabase().then((_) {
      _loadMessagesFromDatabase();
    });
  }
  Future<void> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'messages.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE messages (
            id INTEGER PRIMARY KEY,
            role TEXT,
            content TEXT
          )
        ''');
      },
    );
  }

  List<Message> get messages => _messages;
  Future<void> _loadMessagesFromDatabase() async {
    final List<Map<String, dynamic>> maps = await _database.query('messages');

    // Reverse the order of the retrieved messages
    _messages = List.generate(maps.length, (i) {
      return Message.fromJson(maps[maps.length - 1 - i]);
    });
    notifyListeners();
  }

  Future<void> addMessage(Message message) async {
    _messages.insert(0, message);
    await _database.insert(
      'messages',
      message.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  Future<void> clearMessages() async {
    _messages.clear();
    await _database.delete('messages');
    notifyListeners();
  }
}
