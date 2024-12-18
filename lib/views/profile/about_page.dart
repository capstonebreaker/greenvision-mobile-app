import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 14, height: 1.5,);
    const boldStyle = TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'About GreenVision',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 28.0, right: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logo/logo.png',
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 34),
            const Text(
              'GreenVision adalah aplikasi inovatif yang dirancang untuk membantu petani dan pecinta lingkungan dalam mengelola pertanian secara lebih efektif dan berkelanjutan. Dengan fokus utama pada pemantauan kesehatan tanaman, identifikasi masalah, dan penyediaan solusi tepat guna, GreenVision berkomitmen untuk mendukung pertanian yang cerdas dan ramah lingkungan.',
              style: textStyle,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Misi Kami',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Memberikan solusi digital yang mempermudah petani dan komunitas dalam menghadapi tantangan modern, serta mendorong keberlanjutan di sektor pertanian melalui teknologi.',
              style: textStyle,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Fitur Utama',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Deteksi Penyakit Tanaman\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: 'Dengan bantuan teknologi terkini, GreenVision memungkinkan pengguna mendeteksi penyakit pada tanaman dengan cepat dan akurat. Cukup unggah foto tanaman Anda, dan aplikasi kami akan memberikan diagnosis serta saran perawatan.',
                      style: textStyle,
                    ),
                  ],
                ),
                  textAlign: TextAlign.justify
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '2. Saran Obat dan Perawatan\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: 'GreenVision menyediakan rekomendasi produk perawatan dan obat yang tepat berdasarkan hasil identifikasi penyakit. Setiap saran dilengkapi dengan panduan penggunaan yang mudah dipahami.',
                      style: textStyle,
                    ),
                  ],
                ),
                  textAlign: TextAlign.justify
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '3. Komunitas Petani\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: 'Bergabunglah dengan komunitas petani untuk berbagi pengalaman, mendapatkan solusi atas permasalahan, dan membangun jaringan dengan para ahli dan sesama pengguna.',
                      style: textStyle,
                    ),
                  ],
                ),
                  textAlign: TextAlign.justify
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '4. Dashboard Interaktif\n',
                      style: boldStyle,
                    ),
                    TextSpan(
                      text: 'Pantau perkembangan tanaman, catatan aktivitas, dan kesehatan ladang Anda melalui dashboard yang intuitif dan informatif.',
                      style: textStyle,
                    ),
                  ],
                ),
                  textAlign: TextAlign.justify
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: 'Mari bergabung dengan GreenVision untuk menciptakan masa depan pertanian yang lebih hijau, cerdas, dan berkelanjutan! ',
                    ),
                    TextSpan(
                      text: '🌱',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}