import 'package:flutter/material.dart';
import 'package:flutter_project/latihan/latihan20/latihan20/home.dart';
import 'package:flutter_project/latihan/latihan20/latihan20/profile.dart';
import 'package:flutter_project/latihan/latihan20/latihan20/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarDrawer(), // Menjalankan aplikasi dengan Drawer & Bottom Nav Bar
    );
  }
}

class BelajarDrawer extends StatefulWidget {
  BelajarDrawer({super.key});

  @override
  _BelajarDrawerState createState() => _BelajarDrawerState();
}

class _BelajarDrawerState extends State<BelajarDrawer> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Settings(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Drawer")),
      body: _pages[_selectedIndex],
      drawer: MyDrawer(onTap: (ctx, i) {
        setState(() {
          _selectedIndex = i;
          Navigator.pop(ctx);
        });
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green, // Warna hijau saat dipilih
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function(BuildContext, int) onTap;

  const MyDrawer({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/eren.png'),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Yoga Pratama',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'yogaprattama99@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: () => onTap(context, 0)),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings'), onTap: () => onTap(context, 1)),
            ListTile(leading: Icon(Icons.person), title: Text('Profile'), onTap: () => onTap(context, 2)),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => onTap(context, 0),
            ),
          ],
        ),
      ),
    );
  }
}
