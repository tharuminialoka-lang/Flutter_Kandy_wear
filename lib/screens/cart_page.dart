import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_kandy_wear/screens/models/cart_model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: cart.items.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        leading: Image.asset(item.image, width: 50, height: 50),
                        title: Text(item.name),
                        subtitle: Text(item.price),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            cart.removeItem(item);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${item.name} removed from cart")),
                            );
                          },
                        ),
                      );

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Total: Rs. ${cart.totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
    );
  }
}
