void main(){

  // input hari
  var hari = 21; // Angka antara 1-31
  var bulan = 5; // Angka antara 1-12
  var tahun = 1945; // Angka antara 1900-2200

  List<String> namaBulan = ["Januari", "Februari", "Maret", "April", "Mei", "Juni",
  "Juli", "Agustus", "September", "Oktober", "November", "Desember"];

  String tanggal = "$hari ${namaBulan[bulan]} $tahun";
  print("Tanggal: $tanggal");
}