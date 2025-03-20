import 'package:flutter/material.dart';
import 'package:flutter_project/latihan/latihan30/latihan28.dart';

void main() {
  runApp(MaterialApp(
    home: Latihan27(),
  ));
}

class Latihan27 extends StatefulWidget {
  @override
  State<Latihan27> createState() => _Latihan27State();
}

class _Latihan27State extends State<Latihan27> {
  List<String> agama = [
    "Islam",
    "Kristen Protestan",
    "Kristen Katholik",
    "Hindu",
    "Budha"
  ];

  String _agama = "Islam";
  String _jk = "";

  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerMoto = TextEditingController();

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void _pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimData() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Text("Nama Lengkap : ${controllerNama.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Moto Hidup : ${controllerMoto.text}"),
            Text("Jenis Kelamin : $_jk"),
            Text("Agama : $_agama"),
            ElevatedButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Data Diri"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          TextField(
            controller: controllerNama,
            decoration: InputDecoration(
              hintText: "Nama Lengkap",
              labelText: "Nama Lengkap",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: controllerPass,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: controllerMoto,
            decoration: InputDecoration(
              hintText: "Moto Hidup",
              labelText: "Moto Hidup",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          RadioListTile(
            value: "Laki-laki",
            title: Text("Laki-laki"),
            groupValue: _jk,
            onChanged: (String? value) {
              _pilihJk(value!);
            },
            activeColor: Colors.blue,
            subtitle: Text("Pilih ini jika anda Laki-laki"),
          ),
          RadioListTile(
            value: "Perempuan",
            title: Text("Perempuan"),
            groupValue: _jk,
            onChanged: (String? value) {
              _pilihJk(value!);
            },
            activeColor: Colors.blue,
            subtitle: Text("Pilih ini jika anda perempuan"),
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Text(
                "Agama",
                style: TextStyle(fontSize: 18.0, color: Colors.blue),
              ),
              SizedBox(width: 20.0),
              DropdownButton<String>(
                value: _agama,
                onChanged: (String? value) {
                  _pilihAgama(value!);
                },
                items: agama.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              kirimData();
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterParentScreen()),
              );
            },
            child: Text(
              "Go To Latihan 28",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
