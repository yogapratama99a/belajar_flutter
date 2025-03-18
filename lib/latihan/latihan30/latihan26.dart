import 'package:flutter/material.dart';
import 'package:flutter_project/latihan/latihan30/latihan27.dart';

void main() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    home: Latihan26(),
  ));
}

class Latihan26 extends StatefulWidget {
  @override
  State<Latihan26> createState() => _Latihan26State();
}

class _Latihan26State extends State<Latihan26> {
  final _formKey = GlobalKey<FormState>();
  double nilaiSlider = 3;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Form Flutter"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Masukkan Nama Lengkap",
                      labelText: "Nama Lengkap",
                      icon: Icon(Icons.people),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                CheckboxListTile(
                  title: Text('Belajar Dasar Flutter'),
                  subtitle: Text('Dart, widget, http'),
                  value: nilaiCheckBox,
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      nilaiCheckBox = value!;
                    });
                  },
                ),
                SizedBox(height: 10),
                SwitchListTile(
                  title: Text('Backend Programming'),
                  subtitle: Text('Dart, Nodejs, PHP, Java, dll'),
                  value: nilaiSwitch,
                  activeTrackColor: Colors.pink[100],
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitch = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text("Nilai Slider: ${nilaiSlider.toInt()}"),
                Slider(
                  value: nilaiSlider,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: nilaiSlider.toInt().toString(),
                  onChanged: (value) {
                    setState(() {
                      nilaiSlider = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Form Berhasil Dikirim!")),
                            );
                          }
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Latihan27()),
                          );
                        },
                        child: Text(
                          "Go To Latihan 27",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
