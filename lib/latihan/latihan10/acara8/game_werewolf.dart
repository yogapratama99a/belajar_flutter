import 'dart:io';


void main(){
  // input nama
    stdout.write("Masukkan nama: ");
    String? nama = stdin.readLineSync();

  // cek nama
  if (nama==null || nama.trim().isEmpty){
    print("Nama harus diisi");
    return;
  }

  // input peran
  stdout.write("Masukkan peran (Penyihir/Guard/Werewolf): ");
  String? peran = stdin.readLineSync();

  // cek peran
  if (peran==null || peran.trim().isEmpty){
    print("Halo $nama, Pilih peranmu untuk memulai game");
    
    return;
  }

  print("Selamat datang didunia Werewolf $nama");

  if (peran.toLowerCase() == "penyihir"){
    print("Halo penyihir $nama, kamu dapat melihat siapa yang menjadi werewolf!");
  } else if (peran.toLowerCase() == "guard"){
    print("Halo guard $nama, kamu akan membantu melindungi temanmu dari serangan werewolf.");
  } else if (peran.toLowerCase() == "werewolf"){
    print("Halo werewolf $nama, kamu akan memakan mangsa setiap malam!");
  } else {
    print("Peran yang kamu masukkan tidak valid!");
  }
}
