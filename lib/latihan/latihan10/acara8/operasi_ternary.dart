import 'dart:io';

void main() {
  stdout.write("Mau install aplikasi? (Y/T): ");
  String? jawaban = stdin.readLineSync()?.toUpperCase();

  // Menggunakan operator ternary
  String hasil = (jawaban == "Y") 
      ? "Anda akan menginstall Aplikasi Dart" 
      : (jawaban == "T") 
        ? "Aborted" 
        : "Input tidak valid";

  print(hasil);
}