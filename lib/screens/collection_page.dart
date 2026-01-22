import 'package:flutter/material.dart';
import 'saree_list.dart';

class CollectionsPage extends StatelessWidget {

  final List<Map<String, String>> sareeCollections = [
    {"name": "Silk Sarees", "image": "assets/silk1.jpg"},
    {"name": "Batik Sarees", "image": "assets/batik1.jpg"},
    {"name": "Handloom Sarees", "image": "assets/handloom1.jpg"},
    {"name": "Kanchipuram Sarees", "image": "assets/kanchipuram1.jpg"},
    {"name": "Kandyans", "image": "assets/kandiyan1.jpg"},
    {"name": "Cotton Sarees", "image": "assets/cotton2.jpg"},
    {"name": "Bridal Sarees", "image": "assets/bridal1.jpg"},
    {"name": "Georgette Sarees", "image": "assets/georgette1.jpg"},
    {"name": "Linen Sarees", "image": "assets/linen1.jpg"},
    {"name": "Satin Sarees", "image": "assets/satin1.jpg"},
    {"name": "Velvet Sarees", "image": "assets/velvet1.jpg"},
    {"name": "Mysore Silk Sarees", "image": "assets/mysore1.jpg"},
    {"name": "Printed Sarees", "image": "assets/printed1.jpg"},
    {"name": "Embroidered Sarees", "image": "assets/embroidered1.jpg"},
    {"name": "Organza Sarees", "image": "assets/organza1.jpg"},
    {"name": "Banarasi Sarees", "image": "assets/banarasi1.jpg"}, 
   
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Collections")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: sareeCollections.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,           // 4 blocks per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 22,
            childAspectRatio: 0.5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SareeListPage(
                      sareeType: sareeCollections[index]["name"]!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          sareeCollections[index]["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        sareeCollections[index]["name"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
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
  }}
