import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/home.dart';
import 'view/demoPage.dart';
import 'controller/demoController.dart';
import 'controller/purchase.dart';

void main() {
  // Inisialisasi controller hanya di sini
  Get.put(DemoController());
  Get.put(Purchase());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      home: HomePage(),
      getPages: [
        GetPage(name: '/cart', page: () => DemoPage()),
      ],
    );
  }
}
