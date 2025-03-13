import 'package:flutter/material.dart';

void main() => runApp(BelajarImage());

class BelajarImage extends StatelessWidget {
  const BelajarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("belajarFlutter.com"),
      ),
      body: Image.asset('assets/images/eren.png'),
    ));
  }
}
