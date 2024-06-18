import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import '../models/travel_package.dart';
import '../providers/cart_provider.dart';
import '../widgets/travel_package_card.dart';

class HomePage extends StatelessWidget {
  final List<TravelPackage> packages = [
    TravelPackage(name: 'Tokyo', imagePath: 'assets/images/tokyo.jpg'),
    TravelPackage(name: 'Paris', imagePath: 'assets/images/paris.jpg'),
    TravelPackage(name: 'Holanda', imagePath: 'assets/images/holanda.jpg'),
    TravelPackage(name: 'Canada', imagePath: 'assets/images/canada.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Packages'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          return TravelPackageCard(package: packages[index]);
        },
      ),
    );
  }
}
