import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imageUrls = List.generate(
    10,
        (index) => 'https://source.unsplash.com/random/200x200?sig=$index', // Random Unsplash images
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("GridView with Images")),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0, // Square items
          ),
          itemCount: imageUrls.length,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover, // Scale properly
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator()); // Show loading spinner
                },
                errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 50),
              ),
            );
          },
        ),
      ),
    );
  }
}
