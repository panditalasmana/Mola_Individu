import 'package:flutter/material.dart';

/// Halaman Profil Mahasiswa
/// Menampilkan informasi dasar pengguna (nama, NPM, email)
/// serta tombol logout untuk kembali ke halaman login.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 AppBar bagian atas halaman profil
      appBar: AppBar(
        elevation: 0, // hilangkan bayangan bawah AppBar
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF001F3F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // 🔹 Isi utama halaman
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 🔸 Foto profil pengguna
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),

            const SizedBox(height: 20),

            // 🔸 Nama pengguna
            const Text(
              'Pandita Lasmana',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001F3F),
              ),
            ),

            const SizedBox(height: 8),

            // 🔸 Informasi tambahan (NPM dan Email)
            const Text(
              'NPM: 2357051021',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const Text(
              'Email: panditalasmana@gmail.com',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),

            const Spacer(), // Dorong tombol ke bawah

            // 🔹 Tombol Logout
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF001F3F),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Navigasi kembali ke halaman login (mengganti halaman)
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
