import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

sealed class DataSource {
  static Future<List<dynamic>> convert() async {
    String data = await rootBundle.loadString('assets/json/game_json.json');

    final decoded = jsonDecode(data);
   // debugPrint("Decoded JSON: $decoded");

    if (decoded is! List) {
      //throw Exception("Xatolik:, ammo ${decoded.runtimeType} chiqdi!");
    }

    return decoded;
  }
}
