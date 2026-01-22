import 'package:flutter/material.dart';

class SareeDescriptionPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const SareeDescriptionPage({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              price,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "This is a beautiful $name perfect for any traditional occasion. Made with high-quality materials to ensure comfort and elegance.",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
