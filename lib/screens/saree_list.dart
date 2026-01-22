import 'package:flutter/material.dart';
import 'package:second_kandy_wear/screens/saree_detail_page.dart';
import 'data/saree_data.dart';

class SareeListPage extends StatelessWidget {
  final String sareeType;

  SareeListPage({required this.sareeType});

 
  @override
Widget build(BuildContext context) {
  final sarees = sareeCollections[sareeType] ?? [];

  return Scaffold(
    appBar: AppBar(title: Text(sareeType)),
    body: sarees.isEmpty
        ? Center(child: Text("No sarees available."))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: sarees.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 items per row
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
                          collectionType: sareeType,
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
