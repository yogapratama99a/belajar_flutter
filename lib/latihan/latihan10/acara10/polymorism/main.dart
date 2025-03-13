import 'segitiga.dart';
import 'lingkaran.dart';
import 'persegi.dart';

void main() {
  var segitiga = Segitiga(3, 4);
  var lingkaran = Lingkaran(7);
  var persegi = Persegi(5);

  print("Segitiga:");
  print("Luas: ${segitiga.luas()}");
  print("Keliling: ${segitiga.keliling()}");

  print("\nLingkaran:");
  print("Luas: ${lingkaran.luas()}");
  print("Keliling: ${lingkaran.keliling()}");

  print("\nPersegi:");
  print("Luas: ${persegi.luas()}");
  print("Keliling: ${persegi.keliling()}");
}
