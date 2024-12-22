import 'package:flutter/material.dart';

class DetailArticlePage extends StatelessWidget {
  final Map<String, dynamic> articleData;

  const DetailArticlePage({super.key, required this.articleData});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 14, height: 1.5);

    final String title = articleData['title'] ?? 'Judul tidak tersedia';
    final String imageUrl = articleData['img'] ?? 'https://via.placeholder.com/75';
    final String description = articleData['deskripsi'] ?? 'Deskripsi tidak tersedia';
    final String createdAt = articleData['created_at'] ?? 'Tanggal tidak tersedia';

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(
              createdAt,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 26),
            Text(description, style: textStyle, textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}
