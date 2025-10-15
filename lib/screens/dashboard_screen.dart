import 'package:flutter/material.dart';
import 'car_detail_screen.dart';

/// Halaman utama (dashboard) aplikasi sewa mobil.
/// Menampilkan daftar mobil mewah, fitur pencarian, dan navigasi bawah.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Indeks untuk BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    // 🔹 Data list mobil disimpan dalam bentuk List<Map>
    final cars = [
      {
        'name': 'Porsche 911',
        'price': 'Rp 5.000.000 / hari',
        'image': 'assets/porsche.png',
        'rating': '4.7',
        'desc': 'Mobil sport elegan dengan performa luar biasa.',
        'seats': '2',
        'speed': '300 KM/H',
        'hp': '450 HP',
      },
      {
        'name': 'Toyota Supra',
        'price': 'Rp 3.500.000 / hari',
        'image': 'assets/supra.png',
        'rating': '4.8',
        'desc': 'Mobil legendaris Jepang dengan tenaga besar.',
        'seats': '2',
        'speed': '280 KM/H',
        'hp': '420 HP',
      },
      {
        'name': 'BMW M4',
        'price': 'Rp 4.500.000 / hari',
        'image': 'assets/bmw.png',
        'rating': '4.9',
        'desc': 'Coupe mewah dengan kenyamanan dan performa tinggi.',
        'seats': '4',
        'speed': '290 KM/H',
        'hp': '480 HP',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 AppBar (bagian atas)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // tanpa bayangan
        title: const Row(
          children: [
            // Foto profil kecil di kiri
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(width: 10),
            // Teks sapaan
            Text(
              "Welcome!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: [
          // Tombol menuju halaman profil
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),

      // 🔹 Isi utama halaman
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // 🔸 Kolom pencarian (tidak interaktif, hanya tampilan)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari mobil impianmu...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔸 Judul bagian daftar mobil
            const Text(
              "Luxury Cars",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // 🔸 Daftar mobil horizontal (scroll ke samping)
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];

                  // 🔹 Setiap kartu mobil bisa diklik untuk ke halaman detail
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CarDetailScreen(car: car),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),

                      // 🔹 Isi kartu mobil
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar mobil di atas
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              car['image']!,
                              height: 130,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Nama mobil
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              car['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // Harga dan rating mobil
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  car['price']!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                Text(car['rating']!),
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
          ],
        ),
      ),

      // 🔹 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // Navigasi jika tab Profile diklik
          if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
