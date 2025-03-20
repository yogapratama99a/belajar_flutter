import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/demoController.dart';
import '../controller/purchase.dart';

class HomePage extends StatelessWidget {
  final purchase = Get.put(Purchase());
  final DemoController cart = Get.put(DemoController()); // Perbaikan di sini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomSheet: SafeArea(
        child: Card(
          elevation: 12.0,
          margin: EdgeInsets.zero,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.orangeAccent,
            ),
            height: 65,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      Positioned(
                        right: 5,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent,
                          ),
                          child: Center(
                            child: GetX<DemoController>(builder: (controller) {
                              return Text(
                                '${controller.cartCount}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.0,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GetX<DemoController>(builder: (controller) {
                    return Text(
                      'Total Amount - ${controller.totalAmount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0,
                      ),
                    );
                  }),
                  IconButton(
                    onPressed: () => Get.toNamed('/cart',
                        arguments: "Home Page To Demo Page -> Passing arguments"),
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: GetX<Purchase>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Column(
                  children: [
                    Image.network(
                      product.productImage, // Memperbaiki bagian ini
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName,
                            style: const TextStyle(
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product.productDescription,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                cart.addToCart(product);
                              },
                              child: const Text("Shop Now", style: TextStyle(color: Colors.orange),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
