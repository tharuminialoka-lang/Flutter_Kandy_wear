import 'package:flutter/material.dart';
import '../screens/saree_description_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> latestItems = [
    {
      'name': 'Elegant Silk Saree',
      'price': 'Rs. 5500',
      'image': 'assets/silk1.jpg',
    },
    {
      'name': 'Batik Style Saree',
      'price': 'Rs. 4200',
      'image': 'assets/batik1.jpg',
    },
    {
      'name': 'Kandyan Style Saree',
      'price': 'Rs. 5200',
      'image': 'assets/kandiyan.jpg',
    },
    {
      'name': 'Handloom Saree',
      'price': 'Rs. 7000',
      'image': 'assets/handloom.jpg',
    },
    {
      'name': 'Kanchipuram Style Saree',
      'price': 'Rs. 8500',
      'image': 'assets/kanchipuram.jpg',
    },
  ];

  @override
@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App name in top-left
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10),
          child: Text(
            "Kandy Wear",
            style: TextStyle(
              fontFamily: 'Lobster', // Use custom font here
              fontSize: 34,
              color: Colors.pink[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Stack to overlay text on image
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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Border text layer
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
                  // White fill text layer
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
            itemCount: latestItems.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              final item = latestItems[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SareeDescriptionPage(
                        name: item['name']!,
                        price: item['price']!,
                        image: item['image']!,
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          item['name']!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
