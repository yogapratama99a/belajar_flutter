import 'bangundatar.dart';
import 'dart:math'; // Tambahkan ini untuk sqrt()

class Segitiga extends BangunDatar {
  double alas, tinggi, sisiMiring;

  Segitiga(this.alas, this.tinggi) : sisiMiring = sqrt(alas * alas + tinggi * tinggi); // Gunakan sqrt()

  @override
  double luas() {
    return 0.5 * alas * tinggi;
  }

  @override
  double keliling() {
    return alas + tinggi + sisiMiring;
  }
}
