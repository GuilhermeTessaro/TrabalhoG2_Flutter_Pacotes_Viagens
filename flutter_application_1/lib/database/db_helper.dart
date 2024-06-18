import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/travel_package.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  Future<void> insertTravelPackage(TravelPackage package) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartList = prefs.getStringList('cart') ?? [];
    cartList.add(jsonEncode(package.toMap()));
    await prefs.setStringList('cart', cartList);
  }

  Future<List<TravelPackage>> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartList = prefs.getStringList('cart') ?? [];
    List<TravelPackage> cart = cartList.map((item) {
      Map<String, dynamic> packageMap = jsonDecode(item);
      return TravelPackage(
        id: packageMap['id'],
        name: packageMap['name'],
        imagePath: packageMap['imagePath'],
      );
    }).toList();
    return cart;
  }

  Future<void> deleteTravelPackage(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartList = prefs.getStringList('cart') ?? [];
    cartList.removeWhere((item) {
      Map<String, dynamic> packageMap = jsonDecode(item);
      return packageMap['id'] == id;
    });
    await prefs.setStringList('cart', cartList);
  }
}
