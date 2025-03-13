import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.dashboard,
            color: Colors.white,
          ),
          title: const Text(
            "Belajar MaterialApp Scaffold",
            style: TextStyle(color: Colors.white),
          ),
          actions: const <Widget>[
            Icon(Icons.search),
            // Icon(Icons.find_in_page)
          ],
          actionsIconTheme: const IconThemeData(color: Colors.yellow),
          backgroundColor: Colors.pinkAccent,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: Colors.orange,
                height: 4.0,
              )),
          centerTitle: true,
        ),

        //PERUBAHAN BARU
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          child: const Text('+'),
          onPressed: () {},
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.redAccent, shape: BoxShape.circle),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent, shape: BoxShape.circle),
            ),
            Row(
              //TAMBAHKAN CODE INI
              mainAxisAlignment: MainAxisAlignment.start,
              //TAMBAHKAN CODE INI

              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent, shape: BoxShape.circle),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.redAccent, shape: BoxShape.circle),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent, shape: BoxShape.circle),
                ),
              ],
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
