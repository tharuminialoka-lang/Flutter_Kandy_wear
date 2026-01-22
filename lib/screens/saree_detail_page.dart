import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_kandy_wear/screens/models/cart_model.dart';
import 'buy_page.dart';
import 'data/saree_data.dart';

class SareeDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String collectionType;

  SareeDetailPage({
    required this.name,
    required this.price,
    required this.image,
    required this.collectionType,
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 Related items (same collection, exclude current item)
    final relatedItems = sareeCollections[collectionType]!
        .where((item) => item['name'] != name)
        .toList();

    // 🔹 Other collection items (exclude current collection)
    final otherCollectionItems = sareeCollections.entries
        .where((entry) => entry.key != collectionType)
        .expand((entry) => entry.value)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current saree image
              Center(child: Image.asset(image, height: 250)),

              SizedBox(height: 20),

              // Current saree name & price
              Text(name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(price,
                  style: TextStyle(fontSize: 18, color: Colors.grey[700])),

              SizedBox(height: 20),

              // Description
              Text(
                "This is a beautiful $name perfect for any traditional occasion. Made with high-quality materials to ensure comfort and elegance.",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 30),

              // Buttons: Add to Cart / Buy Now
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Add to Cart"),
                    onPressed: () {
                      final cart =
                          Provider.of<CartModel>(context, listen: false);
                      cart.addItem(
                        CartItem(name: name, price: price, image: image),
                      );
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

              // 🔹 Related Sarees (horizontal scroll)
              if (relatedItems.isNotEmpty) ...[
                SizedBox(height: 30),
                Text(
                  "Related Sarees",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: relatedItems.length,
                    itemBuilder: (context, index) {
                      final item = relatedItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SareeDetailPage(
                                name: item['name']!,
                                price: item['price']!,
                                image: item['image']!,
                                collectionType: collectionType,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 160,
                          margin: EdgeInsets.only(right: 12),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: Image.asset(
                                    item['image']!,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    item['name']!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(item['price']!),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],

              // 🔹 Other Collection Items (grid view)
              if (otherCollectionItems.isNotEmpty) ...[
                SizedBox(height: 30),
                Text(
                  "Other Collections",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: otherCollectionItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 items per row
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final item = otherCollectionItems[index];
                    return GestureDetector(
                      onTap: () {
                        // Find the collection type of this item
                        final newCollectionType = sareeCollections.entries
                            .firstWhere((entry) => entry.value.contains(item))
                            .key;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SareeDetailPage(
                              name: item['name']!,
                              price: item['price']!,
                              image: item['image']!,
                              collectionType: newCollectionType,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                child: Image.asset(
                                  item['image']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                item['name']!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(item['price']!),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
