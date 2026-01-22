import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // ✅ important
import 'package:second_kandy_wear/screens/models/cart_model.dart';
import 'cart_page.dart';
import 'buy_page.dart';

class SareeDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  SareeDetailPage({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(image, height: 250),
            ),
            SizedBox(height: 20),
            Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(price, style: TextStyle(fontSize: 18, color: Colors.grey[700])),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Add to Cart"),
                  onPressed: () {
                    final cart = Provider.of<CartModel>(context, listen: false);
                    cart.addItem(CartItem(name: name, price: price, image: image));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Added to Cart")),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text("Buy Now"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BuyPage(
                          name: name,
                          price: price,
                          image: image,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
