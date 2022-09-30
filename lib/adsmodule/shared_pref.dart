import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(key) != null) {
      return prefs.getBool(key);
    }
    return false;
  }

  static Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<double?> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  static putString(String key, String content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, content);
  }

  static putBool(String key, bool content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, content);
  }

  static putInt(String key, int content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, content);
  }

  static putDouble(String key, double content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, content);
  }

  static Future clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }

  static save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}