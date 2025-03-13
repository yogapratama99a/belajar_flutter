import 'package:flutter/material.dart';

// Fungsi utama untuk menjalankan aplikasi Flutter
void main() {
  runApp(SanberApp());
}

// Kelas utama aplikasi yang merupakan StatelessWidget
class SanberApp extends StatelessWidget {
  const SanberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: HomePage(), 
    );
  }
}

// Halaman utama aplikasi
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanber App'), 
        centerTitle: true, 
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Memusatkan elemen secara vertikal
              crossAxisAlignment: CrossAxisAlignment.center, // Memusatkan elemen secara horizontal
              children: [
                const Icon(Icons.home, size: 100, color: Colors.blue),
                const SizedBox(height: 20),
                
                
                const Text(
                  'Welcome to Sanber App',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                
                
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent, 
                    borderRadius: BorderRadius.circular(10), 
                  ),
                  child: const Text(
                    'Sanber App is a Flutter application with login and register features.',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                
                
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter Text', 
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                
                
                ElevatedButton(
                  onPressed: () {
                    // Aksi yang dilakukan ketika tombol ditekan
                  },
                  child: const Text('Click Me'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
