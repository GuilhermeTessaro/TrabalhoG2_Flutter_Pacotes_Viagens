import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/travel_package.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final cart = cartProvider.cart;
          if (cart.isEmpty) {
            return Center(
              child: Text('Your cart is empty.'),
            );
          } else {
            return ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final package = cart[index];
                return ListTile(
                  leading: Image.asset(
                    package.imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(package.name),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    color: Theme.of(context).errorColor,
                    onPressed: () {
                      cartProvider.removeFromCart(package);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${package.name} removed from cart'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
