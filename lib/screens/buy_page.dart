import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  BuyPage({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 150),
            SizedBox(height: 20),
            Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(price, style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("Proceed to Payment"),
              onPressed: () {
                // Implement payment logic here
              },
            )
          ],
        ),
      ),
    );
  }
}
