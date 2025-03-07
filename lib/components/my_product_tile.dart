import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  //add to cart button
  void addToCart(BuildContext context) {
    //show a dialog box to confirm add to the cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Add this item to your cart?"),
              actions: [
                //cancel
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().addToCart(product);
                  },
                  child: Text("Yes"),
                ),

                //add
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(15)),
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child: Icon(Icons.favorite)),
              ),
              const SizedBox(
                height: 25,
              ),
              //product name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),

              //product description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
          //product price+ add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //price
              Text('\₹ ' + product.price.toStringAsFixed(2)),
              //add to card button
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: Icon(Icons.add)))
            ],
          ),
        ],
      ),
    );
  }
}
