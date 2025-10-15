import 'package:flutter/material.dart';

/// Halaman Register (Pendaftaran Akun Baru)
/// User dapat membuat akun dengan mengisi email dan password.
/// Setelah selesai, diarahkan kembali ke halaman login.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Controller untuk mengambil input dari TextField
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 Pusatkan isi halaman di tengah layar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            // Gunakan scroll agar tidak tertutup keyboard
            child: Column(
              children: [
                // 🔸 Ikon di bagian atas (ikon orang + tanda tambah)
                const Icon(
                  Icons.person_add_alt_1,
                  color: Color(0xFF001F3F),
                  size: 80,
                ),
                const SizedBox(height: 20),

                // 🔸 Judul halaman
                const Text(
                  'Create Account',
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

                // 🔹 Input Password (dengan karakter tersembunyi)
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
                const SizedBox(height: 30),

                // 🔹 Tombol "Sign Up"
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001F3F),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Setelah klik daftar, arahkan ke halaman login
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),

                // 🔹 Link untuk kembali ke halaman Login
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Color(0xFF001F3F)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
