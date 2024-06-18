import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/travel_package.dart';
import '../database/db_helper.dart';

class CartProvider with ChangeNotifier {
  List<TravelPackage> _cart = [];
  DBHelper dbHelper = DBHelper();

  List<TravelPackage> get cart => _cart;

  CartProvider() {
    _loadCart();
  }

  void _loadCart() async {
    _cart = await dbHelper.getCart();
    notifyListeners();
  }

  Future<void> addToCart(TravelPackage package) async {
    await dbHelper.insertTravelPackage(package);
    _cart = await dbHelper.getCart(); // Atualiza a lista após adicionar
    notifyListeners();
  }

  Future<void> removeFromCart(TravelPackage package) async {
    await dbHelper.deleteTravelPackage(package.id!);
    _cart = await dbHelper.getCart(); // Atualiza a lista após remover
    notifyListeners();
  }
}
