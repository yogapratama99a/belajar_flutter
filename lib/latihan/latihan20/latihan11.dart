import 'dart:async';

void main(List<String> args) async{
  var h = Human();
  print("Luffy");
  print("Zoro");
  print("Killer");

  await h.getData();
  print(h.name);
}

class Human{
  String name = "nama character one piece";

  Future<void> getData() async{
    await Future.delayed(const Duration(seconds: 3));
    name = "yoga";
    print("get data [done]");
  }
}
