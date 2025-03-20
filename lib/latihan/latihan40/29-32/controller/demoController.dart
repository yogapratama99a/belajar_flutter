import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../model/product.dart';
import 'package:get/get.dart';

class DemoController extends GetxController {
  var cartItems = <Product>[].obs;
  int get cartCount => cartItems.length;
  double get totalAmount =>
      cartItems.fold(0.0, (sum, element) => sum + element.price);

  addToCart(Product product) {
    cartItems.add(product);
  }

  final storage = GetStorage();
  var isDark = false.obs; // Gunakan RxBool agar bisa diubah dan dipantau

  @override
  void onInit() {
    super.onInit();
    isDark.value = storage.read('darkmode') ?? false; // Load dark mode saat controller dibuat
  }

  ThemeData get theme => isDark.value ? ThemeData.dark() : ThemeData.light();

  void changeTheme(bool val) {
    isDark.value = val;  // Perbarui nilai RxBool
    storage.write('darkmode', val);  // Simpan perubahan ke GetStorage
    Get.changeTheme(theme); // Ubah tema aplikasi secara langsung
  }
}
