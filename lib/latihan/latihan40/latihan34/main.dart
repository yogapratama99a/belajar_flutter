import 'package:flutter/material.dart';
import 'package:flutter_project/latihan/latihan40/latihan34/get_data.dart';
import 'package:flutter_project/main.dart';

void main(){
  runApp(MyApp(),
  );
}

class Latihan34 extends StatelessWidget {
  const Latihan34({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: pageOne(),
      // getPages: pageRouteApp.pages,
      home: GetDataScreen(),
    );
  }
}