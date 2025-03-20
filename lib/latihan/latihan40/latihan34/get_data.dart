import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/latihan/latihan40/latihan34/get_detail_screen.dart';
import '/latihan/latihan40/latihan35/main.dart';

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({Key? key}) : super(key: key);

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  final String url = "https://reqres.in/api/users?page=2";
  List? data;

  @override
  void initState() {
    super.initState();
    _getRefreshData();
  }

  Future<void> _getRefreshData() async {
    await getJsonData();
  }

  Future<void> getJsonData() async {
    var response = await http.get(
      Uri.parse(url),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        var convertDataToJson = jsonDecode(response.body);
        data = convertDataToJson['data'];
      });
    } else {
      print("Gagal mengambil data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get data API Reqres")),
      body: RefreshIndicator(
        onRefresh: _getRefreshData,
        child: data == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GetDetailScreen(
                                  value: data![index]["id"],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    data![index]["avatar"],
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data![index]["first_name"]} ${data![index]["last_name"]}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(data![index]["email"]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MoviesApp(), // Pastikan ini sesuai dengan file Latihan 35
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
