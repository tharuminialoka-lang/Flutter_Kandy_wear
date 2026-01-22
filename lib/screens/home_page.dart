import 'package:flutter/material.dart';
import 'dart:math';
import 'saree_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> allItems = [
    {'name': 'Elegant Red Silk', 'price': 'Rs. 5500', 'image': 'assets/silk1.jpg', 'collectionType': 'Silk Sarees'},
    {'name': 'Royal Stripe Silk', 'price': 'Rs. 6200', 'image': 'assets/silk2.jpg', 'collectionType': 'Silk Sarees'},
    {'name': 'Floral Batik Saree', 'price': 'Rs. 4700', 'image': 'assets/batik2.jpg', 'collectionType': 'Batik Sarees'},
    {'name': 'Batik Style Saree', 'price': 'Rs. 4200', 'image': 'assets/batik1.jpg',' collectionType': 'Batik Sarees'},
    {'name': 'Royal Blue kandiyan', 'price': 'Rs. 5200', 'image': 'assets/kandiyan1.jpg' ,'collectionType': 'Kandyans'},
   
    {"name": "Elegant Floral Kandiyan", "price": "Rs. 5200", "image": "assets/kandiyan2.jpg", 'collectionType': 'Kandyans'},
    {'name': 'Sri lankan Handloom', 'price': 'Rs. 7000', 'image': 'assets/handloom1.jpg', 'collectionType': 'Handloom Sarees'},
    {'name': 'Elegant Red Silk', 'price': 'Rs. 8500', 'image': 'assets/kanchipuram1.jpg', 'collectionType': 'Kanchipuram Sarees'},  
    {'name': 'Comfort Cotton', 'price': 'Rs. 3500', 'image': 'assets/cotton1.jpg', 'collectionType': 'Cotton Sarees'},
    {'name': 'Casual Cotton', 'price': 'Rs. 4000', 'image': 'assets/cotton2.jpg', 'collectionType': 'Cotton Sarees'},
   
    {'name': 'Elegant Bridal Saree', 'price': 'Rs. 15000', 'image': 'assets/bridal1.jpg', 'collectionType': 'Bridal Sarees'},
    {'name': 'Royal Bridal', 'price': 'Rs. 18000', 'image': 'assets/bridal2.jpg', 'collectionType': 'Bridal Sarees'},
    {'name': 'Georgette Glamour', 'price': 'Rs. 6000', 'image': 'assets/georgette1.jpg', 'collectionType': 'Georgette Sarees'},
    {'name': 'Luxury Linen', 'price': 'Rs. 4800', 'image': 'assets/linen1.jpg', 'collectionType': 'Linen Sarees'},
    {'name': 'Stylish Linen', 'price': 'Rs. 5000', 'image': 'assets/linen2.jpg', 'collectionType': 'Linen Sarees'},
   
    {'name': 'Elegant Satin', 'price': 'Rs. 7000', 'image': 'assets/satin1.jpg', 'collectionType': 'Satin Sarees'},
    {'name': 'Shiny Satin', 'price': 'Rs. 7200', 'image': 'assets/satin2.jpg',' collectionType': 'Satin Sarees'},
    {'name': 'Velvet Vogue', 'price': 'Rs. 9000', 'image': 'assets/velvet1.jpg',  'collectionType': 'Velvet Sarees'},
    {'name': 'Elegant Mysore Silk', 'price': 'Rs. 8000', 'image': 'assets/mysore1.jpg', 'collectionType': 'Mysore Silk Sarees'},
    {'name': 'Classic Mysore Silk', 'price': 'Rs. 9500', 'image': 'assets/mysore2.jpg', 'collectionType': 'Mysore Silk Sarees'},
    
    {'name': 'Printed Perfection', 'price': 'Rs. 4000', 'image': 'assets/printed1.jpg', 'collectionType': 'Printed Sarees'},
    {'name': 'Delicate Embroidery', 'price': 'Rs. 9500', 'image': 'assets/embroidered1.jpg', 'collectionType': 'Embroidered Sarees'},
    {'name': 'Sheer Organza', 'price': 'Rs. 11000', 'image': 'assets/organza1.jpg', 'collectionType': 'Organza Sarees'},
    {'name': 'Traditional Banarasi', 'price': 'Rs. 13000', 'image': 'assets/banarasi1.jpg', 'collectionType': 'Banarasi Sarees'},
    {'name': 'Exquisite Banarasi', 'price': 'Rs. 14000', 'image': 'assets/banarasi2.jpg', 'collectionType': 'Banarasi Sarees'},
  ];

  late List<Map<String, String>> latestItems;

  @override
  void initState() {
    super.initState();
    _generateLatestItems();
  }

  void _generateLatestItems() {
    final random = Random();
    latestItems = List.from(allItems)..shuffle(random);
    latestItems = latestItems.take(12).toList(); // show only 8 items
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App title
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10),
            child: Text(
              "Kandy Wear",
              style: TextStyle(
                
                fontFamily: 'Lobster',
                fontSize: 34,
                color: Colors.pink[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Banner
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/background.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'Welcome to Kandy Wear\nWhere Tradition Meets Elegance!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      'Welcome to Kandy Wear\nWhere Tradition Meets Elegance!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          Center(
            child: Text(
              "Latest Items",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: latestItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                final item = latestItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SareeDetailPage(
                          name: item['name']!,
                          price: item['price']!,
                          image: item['image']!,
                          collectionType: item['collectionType']!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
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
                            style: TextStyle(fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
    );
  }
}
