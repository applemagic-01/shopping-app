import 'package:ecommerce/models/shop.dart';
import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/shop_page.dart';
import 'package:ecommerce/themes/light_mode.dart';
import 'package:provider/provider.dart';

import 'pages/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightmode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
