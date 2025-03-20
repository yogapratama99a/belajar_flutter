import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: RegisterParentScreen()));
}

class RegisterParentScreen extends StatefulWidget {
  const RegisterParentScreen({super.key});

  @override
  _RegisterParentScreenState createState() => _RegisterParentScreenState();
}

class _RegisterParentScreenState extends State<RegisterParentScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "TK Pintar",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 5.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 120,
                        height: 120,
                        color: Colors.white, // Placeholder untuk logo
                        child: const Icon(Icons.school,
                            size: 80, color: Colors.green),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                const Text(
                  "Selamat Datang",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Silahkan melakukan pendaftaran akun, untuk dapat mengakses fitur yang tersedia dalam Aplikasi Teka.In",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                const SizedBox(height: 16),

                // Input Email
                CustomInputField(
                  hintText: "Masukkan Email",
                  labelText: "Masukkan Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),

                // Input NIS
                CustomInputField(
                  labelText: "Masukkan NIS",
                  hintText: "Masukkan NIS",
                  controller: nisController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),

                // Input Password
                CustomInputField(
                  hintText: "Masukkan Kata Sandi",
                  labelText: "Masukkan Kata Sandi",
                  controller: passwordController,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 12),

                // Konfirmasi Password
                CustomInputField(
                  hintText: "Konfirmasi Kata Sandi",
                  labelText: "Konfirmasi Kata Sandi",
                  controller: confirmPasswordController,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16),

                Center(
                  child: AuthButton(
                    text: 'DAFTAR',
                    onPressed: () {
                      // Tambahkan aksi saat tombol daftar ditekan
                    },
                  ),
                ),
                const SizedBox(height: 10),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Apakah anda sudah memiliki akun?",
                        style: TextStyle(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          " Masuk",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
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

// Komponen CustomInputField (input field dengan border)
class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.black), // Warna label default
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
              color: Colors.green, width: 2.0), // Warna border saat fokus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide:
              const BorderSide(color: Colors.grey), // Warna border default
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      cursorColor: Colors.green, // Warna kursor hijau
      style: const TextStyle(color: Colors.black), // Warna teks input
    );
  }
}

// Komponen AuthButton (tombol utama)
class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
