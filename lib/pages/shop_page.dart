import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.grey,
          title: Text("Shop Page"),
          actions: [
            //cart button
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop sub title

            Center(
                child: Text(
              "Pick from the selected list of premium products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: products.length,
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //get individual product from shop
                    final product = products[index];

                    //return as a product title UI
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
