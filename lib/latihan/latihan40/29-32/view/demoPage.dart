import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/demoController.dart';
import '/latihan/latihan40/latihan34/main.dart';

class DemoPage extends StatelessWidget {
  final DemoController ctrl = Get.find<DemoController>();

  @override
  Widget build(BuildContext context) {
    // Cek jika ada argument sebelum menggunakannya
    final args = Get.arguments ?? "No arguments passed";

    return Scaffold(
      appBar: AppBar(title: const Text('Demo Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(args),
            ),
            Obx(() => SwitchListTile(
                  value: ctrl.isDark.value, // Gunakan .value karena RxBool
                  title: const Text("Touch to change ThemeMode"),
                  onChanged: (value) => ctrl.changeTheme(value),
                )),
            ElevatedButton(
                onPressed: () => Get.snackbar(
                      "Snackbar", "Hello this is the Snackbar message",
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white,
                      backgroundColor: Colors.black87),
                child: const Text('Snack Bar')),
            ElevatedButton(
                onPressed: () => Get.defaultDialog(
                      title: "Dialogue",
                      content: const Text('Hey, From Dialogue'),
                    ),
                child: const Text('Dialogue')),
            ElevatedButton(
                onPressed: () => Get.bottomSheet(
                      Container(
                        height: 150,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            'Hello From Bottom Sheet',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                child: const Text('Bottom Sheet')),
            ElevatedButton(
                onPressed: () => Get.offNamed('/'), 
                child: const Text('Back To Home')),

            // Tombol ke Halaman Latihan34
            const SizedBox(height: 20), // Spasi agar tidak terlalu rapat
            ElevatedButton(
              onPressed: () {
                Get.to(() => Latihan34());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Ke Latihan 34",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
