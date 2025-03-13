import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> gambar = [
    "beast_titan.jpg",
    "armor_titan.jpg",
    "attack_titan.jpg",
  ];

  static const Map<String, Color> colors = {
    'beast_titan': Color(0xFF2DB569),
    'armor_titan': Color(0xFFF386B8),
    'attack_titan': Color(0xFFF45CAF5),
  };

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.black, Colors.redAccent],
          ),
        ),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: gambar.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
              child: Material(
                elevation: 8.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Hero(
                      tag: gambar[i],
                      child: Material(
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Halamandua(
                                gambar: gambar[i],
                                colors: colors.values.elementAt(i),
                              ),
                            ),
                          ),
                          child: Container(
                            color: colors.values.elementAt(i),
                            child: Image.asset(
                              "assets/images/${gambar[i]}", // PATH DIUBAH
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Halamandua extends StatelessWidget {
  const Halamandua({required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BT21"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                stops: [0.2, 0.6, 1.0],
                colors: [Colors.purple, Colors.white, Colors.deepPurple],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: gambar,
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: ClipOval(
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        color: colors,
                        child: Image.asset(
                          "assets/images/$gambar", // PATH DIUBAH
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Home()));
}
