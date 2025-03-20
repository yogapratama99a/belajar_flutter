import '../model/product.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Purchase extends GetxController{
  var products = <Product>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = [
      Product(1, "Demo Product", "https://d1r7omh34z6onh.cloudfront.net/gk/production/7fbdeb9a82571515302c877cdad1e304.jpg",
      "This is a Golda Coffe, ready to accompany you", 300.0),
      Product(1, "Demo Product", "https://d1r7omh34z6onh.cloudfront.net/gk/production/7fbdeb9a82571515302c877cdad1e304.jpg",
      "This is a Golda Coffe, ready to accompany you", 300.0),
      Product(1, "Demo Product", "https://d1r7omh34z6onh.cloudfront.net/gk/production/7fbdeb9a82571515302c877cdad1e304.jpg",
      "This is a Golda Coffe, ready to accompany you", 300.0),
      Product(1, "Demo Product", "https://d1r7omh34z6onh.cloudfront.net/gk/production/7fbdeb9a82571515302c877cdad1e304.jpg",
      "This is a Golda Coffe, ready to accompany you", 300.0),
    ];

    products.value = serverResponse;
  }
}