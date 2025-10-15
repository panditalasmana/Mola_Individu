import 'package:flutter/material.dart';

/// Halaman detail mobil untuk menampilkan informasi lengkap
/// seperti gambar, deskripsi, rating, fitur, dan tombol sewa.
class CarDetailScreen extends StatelessWidget {
  /// Data mobil dikirim dalam bentuk Map (nama, harga, gambar, dll)
  final Map<String, String> car;

  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Latar belakang utama hitam agar gambar dan konten lebih kontras
      backgroundColor: Colors.black,

      // AppBar transparan dengan ikon dan judul berwarna putih
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Hilangkan bayangan bawah AppBar
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Car Details', style: TextStyle(color: Colors.white)),
        actions: const [
          // Ikon favorit (belum interaktif)
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),

      // Bagian utama halaman
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar mobil di bagian atas
          Center(child: Image.asset(car['image']!, height: 200)),

          const SizedBox(height: 20),

          // Kontainer putih di bawah untuk menampilkan detail
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 Bagian Judul & Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        car['name']!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text(
                            car['rating']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // 🔹 Deskripsi mobil
                  Text(
                    car['desc']!,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Judul bagian fitur mobil
                  const Text(
                    "Features",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  // 🔹 Fitur mobil (kursi, kecepatan, tenaga mesin)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFeature(Icons.chair, '${car['seats']} seats'),
                      _buildFeature(Icons.speed, car['speed']!),
                      _buildFeature(Icons.engineering, car['hp']!),
                    ],
                  ),

                  const Spacer(),

                  // 🔹 Bagian harga & tombol sewa
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Harga sewa
                      Text(
                        car['price']!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),

                      // Tombol "Sewa Sekarang"
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                        onPressed: () {
                          // Menampilkan pesan pop-up sebagai simulasi menghubungi admin
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Hubungi admin: +62 812-3456-7890'),
                            ),
                          );
                        },
                        child: const Text('Sewa Sekarang'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget kecil untuk menampilkan fitur (ikon + teks)
  Widget _buildFeature(IconData icon, String text) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.black, size: 28),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
