// Import package utama Flutter untuk membangun UI
import 'package:flutter/material.dart';

// Import semua file halaman (screen) yang digunakan dalam aplikasi
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/profile_screen.dart';

/// Fungsi utama aplikasi Flutter.
/// Fungsi ini dijalankan pertama kali saat aplikasi dimulai.
void main() {
  runApp(const MyApp()); // Menjalankan aplikasi utama (root widget)
}

/// Widget utama dari aplikasi.
/// Mengatur tema, rute (navigasi halaman), dan tampilan awal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan label "Debug" di pojok kanan atas
      title: 'Luxury Car Rent', // Judul aplikasi (muncul di task manager atau tab)
      
      // 🔹 Tema global aplikasi
      theme: ThemeData(
        primarySwatch: Colors.red, // Warna utama aplikasi
      ),

      // 🔹 Halaman pertama yang akan ditampilkan
      initialRoute: '/',

      // 🔹 Daftar semua rute (halaman) dalam aplikasi
      routes: {
        '/': (context) => const SplashScreen(), // Halaman pembuka (Splash)
        '/login': (context) => const LoginScreen(), // Halaman login
        '/register': (context) => const RegisterScreen(), // Halaman daftar akun
        '/dashboard': (context) => const DashboardScreen(), // Halaman utama berisi daftar mobil
        '/profile': (context) => const ProfileScreen(), // Halaman biodata mahasiswa
      },
    );
  }
}
git