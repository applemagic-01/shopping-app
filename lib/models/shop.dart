import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    //products
    Product(
      name: "Product 1",
      price: 99.99,
      description: "Product 1 description",
      // imagePath: imagePath
    ),
    Product(
      name: "Product 2",
      price: 29.99,
      description: "Product 2 description",
      // imagePath: imagePath
    ),
    Product(
      name: "Product 3",
      price: 39.99,
      description: "Product 3 description",
      // imagePath: imagePath
    ),
    Product(
      name: "Product 4",
      price: 69.69,
      description: "Product 4 description",
      // imagePath: imagePath
    ),
  ];

  //user cart
  List<Product> _cart = [];
  //get products list
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;

  //add items to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove items from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
