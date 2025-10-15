import 'package:flutter/material.dart';

/// Halaman Login untuk aplikasi sewa mobil.
/// Menyediakan input email & password dengan validasi sederhana.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 🔹 Controller untuk mengambil nilai dari TextField
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  // 🔹 Variabel untuk menyimpan pesan error (jika login gagal)
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 Isi halaman di tengah layar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            // Gunakan scroll agar tampilan tetap bisa diakses saat keyboard muncul
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔸 Logo aplikasi (ikon mobil)
                const Icon(
                  Icons.directions_car_filled,
                  color: Color(0xFF001F3F),
                  size: 80,
                ),
                const SizedBox(height: 20),

                // 🔸 Judul aplikasi
                const Text(
                  'Luxury Car Rent',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001F3F),
                  ),
                ),
                const SizedBox(height: 40),

                // 🔹 Input Email
                TextField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Input Password (disembunyikan dengan obscureText)
                TextField(
                  controller: passCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Pesan error muncul jika login gagal
                if (errorText != null)
                  Text(
                    errorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),

                // 🔹 Tombol Login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001F3F),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Logika validasi login sederhana
                    if (emailCtrl.text == 'user' && passCtrl.text == '1234') {
                      // Jika benar, pindah ke halaman dashboard
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    } else {
                      // Jika salah, tampilkan pesan error merah
                      setState(() {
                        errorText = 'Email atau password salah!';
                      });
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),

                // 🔹 Link untuk ke halaman Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFF001F3F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
