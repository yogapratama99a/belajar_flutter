import 'package:flutter/material.dart';
import 'package:flutter_project/latihan/latihan30/latihan22.dart'; // Pastikan path ini benar

void main() {
  runApp(MaterialApp(
    home: Latihan21(),
  ));
}

class Latihan21 extends StatefulWidget {
  @override
  _Latihan21State createState() => _Latihan21State();
}

class _Latihan21State extends State<Latihan21> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Colors.white,
              Colors.purpleAccent,
              Colors.deepPurple,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Latihan 21",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Latihan22()),
                  );
                },
                child: Text("Go To Latihan 22",
                style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
