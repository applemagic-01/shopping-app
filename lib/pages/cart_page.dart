import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Remove this item from your cart?"),
              actions: [
                //cancel
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text("Yes"),
                ),

                //add
              ],
            ));
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content:
                  Text("User wants to pay connect this app to your backend"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.blueGrey,
        title: Text('Cart'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text('Your cart is empty!!'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual items in cart and return

                      final item = cart[index];

                      //return as a  cart tile
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove)),
                      );
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text("Buy now")),
          )
        ],
      ),
    );
  }
}
