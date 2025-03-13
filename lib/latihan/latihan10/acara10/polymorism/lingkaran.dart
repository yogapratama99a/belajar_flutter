import 'bangundatar.dart';
import 'dart:math';

class Lingkaran extends BangunDatar{

  double jariJari;

  Lingkaran(this.jariJari);

  @override
  double luas() {
    return pi * jariJari * jariJari;
  }

   @override
  double keliling() {
    return 2 * pi * jariJari;
  }

}