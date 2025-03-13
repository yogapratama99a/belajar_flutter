void main() {
  // 1. Simulasi Tiktok Live Permintaan Tantangan mengenai Game PS
  // menggunakan while loop
  var antrian = 1;
  var totalOrang = 5;
  print("🎬 Mulai pemrosesan antrian permintaan tantangan...");
  
  while (antrian <= totalOrang) {
    print("Orang ke-$antrian mengirim hadiah...");
    antrian++;
  }
  print("Semua tantangan telah dilayani!\n");

  // 2. Simulasi harga dan total pemasukan
  // menggunakan for-loop
  var harga = 10000;
  var totalPemasukan = 0;

  print("Menghitung total pemasukan Tiktok Live...");
  for (var i = 1; i <= totalOrang; i++) {
    totalPemasukan += harga;
    print("Total pemasukan setelah tantangan ke-$i: Rp$totalPemasukan");
  }
  print("Total pemasukan hari ini: Rp$totalPemasukan\n");

  // 3. Menentukan orang yang mendapatkan permintaan gratis di live berikutnya 
  // menggunakan for-loop dengan increment lebih dari 1
  print("Menentukan orang yang mendapatkan permintaan tantangan gratis...");
  for (var i = 1; i <= totalOrang; i += 2) {
    print("Orang ke-$i mendapatkan permintaan tantangan gratis di game berikutnya");
  }

}
