import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

void main(){
  // Membuat objek dari setiap kelas
  var armor = ArmorTitan();
  var attack = AttackTitan();
  var beast = BeastTitan();
  var human = Human();

  // Set nilai power
  armor.powerPoint = 3;
  attack.powerPoint = 8;
  beast.powerPoint = 4;
  human.powerPoint = 6;

  // Cetak hasilnya
  print("Armor Titan Power: ${armor.powerPoint}");
  print("Armor Titan Action: ${armor.terjang()}");

  print("Attack Titan Power: ${attack.powerPoint}");
  print("Attack Titan Action: ${attack.pukul()}");

  print("Beast Titan Power: ${beast.powerPoint}");
  print("Beast Titan Action: ${beast.lempar()}");

  print("Human Power: ${human.powerPoint}");
  print("Human Action: ${human.killAllTitan()}");
}