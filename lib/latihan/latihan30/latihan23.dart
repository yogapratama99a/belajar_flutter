import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_project/latihan/latihan30/latihan25.dart';

class Latihan23 extends StatefulWidget {
  @override
  _Latihan23State createState() => _Latihan23State();
}

class _Latihan23State extends State<Latihan23> {
  final List<String> gambar = [
    "beast_titan.jpg",
    "armor_titan.jpg",
    "attack_titan.jpg",
  ];

  static const Map<String, Color> colors = {
    'beast_titan.jpg': Color(0xFF2DB569),
    'armor_titan.jpg': Color(0xFFF386B8),
    'attack_titan.jpg': Color(0xFF45CAF5),
  };

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                    child: Hero(
                      tag: gambar[i],
                      child: Material(
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Halamandua(
                                gambar: gambar[i],
                                colors: colors[gambar[i]]!,
                              ),
                            ),
                          ),
                          child: Container(
                            color: colors[gambar[i]],
                            child: Image.asset(
                              "assets/images/${gambar[i]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Latihan25()),
                  );
                },
                child: Text("Go To Latihan 25",
                style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Halamandua extends StatefulWidget {
  const Halamandua({required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  State<Halamandua> createState() => _HalamanduaState();
}

class Pilihan {
  const Pilihan({required this.teks, required this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = <Pilihan>[
  Pilihan(teks: "Red", warna: Colors.red),
  Pilihan(teks: "Green", warna: Colors.green),
  Pilihan(teks: "Blue", warna: Colors.blue),
];

class _HalamanduaState extends State<Halamandua> {
  Color warna = Colors.grey;

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titan"),
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
              return listPilihan.map((Pilihan x) {
                return PopupMenuItem<Pilihan>(
                  value: x,
                  child: Text(x.teks),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [Colors.purple, Colors.deepPurple],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: widget.gambar,
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: ClipOval(
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        color: widget.colors,
                        child: Image.asset(
                          "assets/images/${widget.gambar}",
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
  runApp(MaterialApp(home: Latihan23()));
}