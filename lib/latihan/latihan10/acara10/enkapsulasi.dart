import 'dart:math';

class Lingkaran {
  double _radius = 0.0;

  // Constructor dengan validasi agar radius tidak negatif
  Lingkaran(double radius) {
    this.radius = radius;
  }

  // Setter untuk memastikan radius selalu positif
  set radius(double value) {
    _radius = value < 0 ? -value : value;
  }

  // Getter untuk mengakses radius
  double get radius => _radius;

  // Getter untuk menghitung luas lingkaran
  double get luas => pi * _radius * _radius;
}

void main() {
  var lingkaran = Lingkaran(-10.0); // Input negatif akan menjadi positif
  print("Radius: ${lingkaran.radius}");
  print("Luas Lingkaran: ${lingkaran.luas}");
}