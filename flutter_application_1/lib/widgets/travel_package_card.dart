import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/travel_package.dart';
import '../providers/cart_provider.dart';
import '../pages/map_page.dart';

class TravelPackageCard extends StatelessWidget {
  final TravelPackage package;

  TravelPackageCard({required this.package});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              package.imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  package.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(package);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${package.name} added to cart'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Define as coordenadas baseadas no pacote de viagem
                    double lat = 0.0;
                    double long = 0.0;
                    if (package.name == 'Tokyo') {
                      lat = 35.6895;
                      long = 139.6917;
                    } else if (package.name == 'Paris') {
                      lat = 48.8566;
                      long = 2.3522;
                    } else if (package.name == 'Holanda') {
                      lat = 52.3676;
                      long = 4.9041;
                    } else if (package.name == 'Canada') {
                      lat = 45.4215;
                      long = -75.6972;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MapPage(latitude: lat, longitude: long),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('View on Map'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
