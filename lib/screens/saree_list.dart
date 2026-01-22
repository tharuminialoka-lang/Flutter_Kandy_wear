import 'package:flutter/material.dart';
import 'package:second_kandy_wear/screens/saree_detail_page.dart';

class SareeListPage extends StatelessWidget {
  final String sareeType;

  SareeListPage({required this.sareeType});

  // Simulated saree data for each type
  final Map<String, List<Map<String, String>>> sareeData = {
    "Silk Sarees": [
      {
        "name": "Elegant Red Silk",
        "price": "Rs. 5500",
        "image": "assets/silk1.jpg",
      },
      {
        "name": "Royal Stripe Silk",
        "price": "Rs. 6200",
        "image": "assets/silk2.jpg",
      },
      {
        "name": "Royal red Silk",
        "price": "Rs. 6200",
        "image": "assets/silk3.jpg",
      },
    ],
    "Batik Sarees": [
      {
        "name": "Floral Batik",
        "price": "Rs. 4700",
        "image": "assets/batik1.jpg",
      },
      {
        "name": "Elegant Floral Batik",
        "price": "Rs. 6200",
        "image": "assets/batik2.jpg",
      },
      {
        "name": "Royal Blue Batik",
        "price": "Rs. 4500",
        "image": "assets/batik3.jpg",
      },
    ],

    "Handloom Sarees": [
      {
        "name": "Sri lankan Handloom",
        "price": "Rs. 6700",
        "image": "assets/handloom.jpg",
      },
      {
        "name": "Elegant Floral Handloom",
        "price": "Rs. 8000",
        "image": "assets/handloom2.jpg",
      },
    ],
    "Kanchipuram Sarees": [
      {
        "name": "Elegant Red Silk",
        "price": "Rs. 5500",
        "image": "assets/kanchipuram.jpg",
      },
      {
        "name": "Royal Stripe Silk",
        "price": "Rs. 6200",
        "image": "assets/kanchipuram2.jpg",
      },
      {
        "name": "Royal red Silk",
        "price": "Rs. 6200",
        "image": "assets/kanchipuram3.jpg",
      },
    ],
    "Kandyans": [
      {
        "name": "Floral Modern Kandiyan",
        "price": "Rs. 4700",
        "image": "assets/kandiyan.jpg",
      },
      {
        "name": "Elegant Floral Kandiyan",
        "price": "Rs. 6200",
        "image": "assets/kandiyan2.jpg",
      },
      {
        "name": "Royal Blue kandiyan",
        "price": "Rs. 4500",
        "image": "assets/kandiyan3.jpg",
      },
    ],

    // Add other types similarly
  };

  @override
Widget build(BuildContext context) {
  final sarees = sareeData[sareeType] ?? [];

  return Scaffold(
    appBar: AppBar(title: Text(sareeType)),
    body: sarees.isEmpty
        ? Center(child: Text("No sarees available."))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: sarees.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 2 items per row
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.6, // Adjust height
              ),
              itemBuilder: (context, index) {
                final saree = sarees[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SareeDetailPage(
                          name: saree["name"]!,
                          price: saree["price"]!,
                          image: saree["image"]!,
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
                              saree["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                saree["name"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                saree["price"]!,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
  );
}

}
