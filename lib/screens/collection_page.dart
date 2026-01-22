import 'package:flutter/material.dart';
import 'saree_list.dart';

class CollectionsPage extends StatelessWidget {
  final List<String> sareeTypes = [
    "Silk Sarees",
    "Batik Sarees",
    "Handloom Sarees",
    "Kanchipuram Sarees",
    "Kandyans",
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text("Collections")),
      body: ListView.builder(
        itemCount: sareeTypes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(sareeTypes[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SareeListPage(
                    sareeType: sareeTypes[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

