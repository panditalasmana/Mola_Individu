import 'package:flutter/material.dart';

/// Halaman Splash Screen
/// Ditampilkan pertama kali saat aplikasi dibuka.
/// Menampilkan logo dan teks aplikasi dengan efek animasi fade-in.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// State untuk mengatur animasi dan navigasi otomatis
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Pengatur durasi animasi
  late Animation<double> _fadeInAnimation; // Efek transparansi (fade)

  @override
  void initState() {
    super.initState();

    // 🔹 Inisialisasi AnimationController (durasi animasi 2 detik)
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // 🔹 Membuat efek animasi masuk (fade-in)
    _fadeInAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // 🔹 Menjalankan animasi saat halaman pertama kali muncul
    _controller.forward();

    // 🔹 Setelah 5 detik, otomatis pindah ke halaman login
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    // 🔹 Pastikan animasi dihentikan saat widget dihapus untuk menghindari error
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Isi seluruh layar
        children: [
          // 🔸 Gambar latar belakang (mobil mewah)
          Image.asset(
            'assets/bg_car.jpg',
            fit: BoxFit.cover, // Gambar menutupi seluruh layar
          ),

          // 🔸 Overlay gradasi hitam agar teks lebih terbaca
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // 🔸 Efek Fade pada teks dan ikon
          FadeTransition(
            opacity: _fadeInAnimation,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // 🔹 Ikon mobil di tengah layar
                  Icon(
                    Icons.directions_car_filled_rounded,
                    color: Colors.white,
                    size: 100,
                  ),
                  SizedBox(height: 20),

                  // 🔹 Nama aplikasi
                  Text(
                    'Luxury Car Rent',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10),

                  // 🔹 Slogan aplikasi
                  Text(
                    'Drive your dream, in style.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
