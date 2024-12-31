import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 14);

    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      appBar: AppBar(
        backgroundColor: AppColorsLight.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Security'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 28.0, right: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kebijakan Privasi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Pada saat Anda mengakses aplikasi GreenVision dan layanan online yang Kami sediakan, maka semua informasi dan data pribadi Anda akan Kami kumpulkan dengan ketentuan sebagai berikut:',
              style: textStyle,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '1. Pengumpulan Informasi Teknis\n'
                    'Kami akan mengumpulkan informasi tentang perangkat yang Anda gunakan untuk mengakses aplikasi, termasuk namun tidak terbatas pada alamat IP, sistem operasi, jenis browser atau aplikasi, halaman yang diakses, lokasi geografis, waktu akses, dan data teknis lainnya yang relevan.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '2. Pengumpulan Data Pribadi\n'
                    'Kami dapat meminta Anda untuk memberikan data pribadi, seperti nama lengkap, alamat email, nomor telepon, alamat lengkap, informasi transaksi, dan data lain yang dibutuhkan untuk menggunakan fitur aplikasi secara optimal.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '3. Penggunaan Data Pribadi\n'
                    'Informasi pribadi yang Anda berikan dapat Kami gunakan untuk:\n'
                    '• Memberikan informasi terkait produk, layanan, dan fitur aplikasi.\n'
                    '• Melakukan pengiriman notifikasi, seperti saran perawatan tanaman padi, informasi produk, atau berita terbaru yang\n'
                    '• Menyediakan pengalaman pengguna yang lebih baik dengan mempersonalisasi layanan berdasarkan preferensi Anda.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '4. Berbagi Data dengan Pihak Ketiga\n'
                    'Data pribadi Anda dapat Kami bagikan kepada mitra atau pihak ketiga yang bekerja sama dengan Kami, sejauh diperlukan untuk memberikan layanan yang Anda butuhkan. Kami tidak akan menjual atau menyebarkan data pribadi Anda tanpa persetujuan eksplisit.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '5. Perlindungan Data Pribadi\n'
                    'Kami akan mengambil langkah-langkah yang wajar untuk melindungi data pribadi Anda dari akses tidak sah, penggunaan yang tidak sah, dan pengungkapan. Namun, keamanan 100% tidak dapat dijamin, sehingga Anda juga bertanggung jawab atas keamanan akun Anda, termasuk menjaga kerahasiaan kata sandi.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '6. Perubahan dan Pembaruan Data\n'
                    'Anda dapat memperbarui atau mengubah data pribadi Anda melalui fitur yang tersedia di aplikasi. Kami sangat menyarankan untuk melakukan perubahan kata sandi secara berkala untuk melindungi akun Anda.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '7. Notifikasi dan Komunikasi\n'
                    'Dengan menggunakan aplikasi ini, Anda menyetujui untuk menerima notifikasi dan informasi terbaru melalui nomor ponsel atau email yang telah Anda daftarkan.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '8. Penghapusan Data\n'
                    'Anda dapat meminta penghapusan data pribadi Anda melalui email GreenVision@gmail.com. Kami akan mengkonfirmasi permintaan Anda sebelum memproses penghapusan data sesuai dengan kebijakan privasi ini.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '9. Keamanan Akun\n'
                    'Anda bertanggung jawab atas keamanan akun Anda, termasuk menjaga kerahasiaan kata sandi dan mencegah akses tidak sah. Jika Anda mencurigai adanya pelanggaran keamanan, segera hubungi Kami melalui email di GreenVision@gmail.com.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Ketentuan Lain\n'
                    'Dengan menggunakan aplikasi GreenVision, Anda menyetujui pengumpulan, penyimpanan, dan penggunaan data pribadi Anda sebagaimana diuraikan dalam kebijakan ini. Kebijakan ini dapat berubah sewaktu-waktu, dan Kami akan memberi tahu Anda tentang pembaruan melalui aplikasi atau email.',
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}