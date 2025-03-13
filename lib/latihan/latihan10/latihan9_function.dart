void main() {
  // 1. Menampilkan ucapan selamat datang
  tampilkanUcapan();
  
  // 2. Menghitung nilai akhir peserta bootcamp
  int nilaiAkhir = hitungNilai(80, 90); // Nilai ujian = 80, Nilai tugas = 90
  print("Nilai Akhir: $nilaiAkhir");
  
  // 3. Menentukan kategori nilai berdasarkan nilai akhir
  String kategori = kategoriNilai(nilaiAkhir);
  print("Kategori: $kategori");
  
  // 4. Menampilkan informasi lengkap peserta
  tampilkanInfo("Yoga Pratama", nilaiAkhir);
}


// 1️⃣ Function tanpa return: Menampilkan ucapan selamat datang
void tampilkanUcapan() {
  print("🎉 Selamat Datang di Bootcamp Mobile Development!");
}

// 2️⃣ Function dengan return: Menghitung nilai akhir berdasarkan rata-rata
int hitungNilai(int nilaiUjian, int nilaiTugas) {
  return (nilaiUjian + nilaiTugas) ~/ 2; // Menggunakan ~/ untuk pembagian integer
}

// 3️⃣ Function dengan parameter: Memberikan kategori nilai
String kategoriNilai(int nilai) {
  if (nilai >= 85) {
    return "A (Sangat Baik)";
  } else if (nilai >= 70) {
    return "B (Baik)";
  } else if (nilai >= 50) {
    return "C (Cukup)";
  } else {
    return "D (Kurang)";
  }
}

// 4️⃣ Function dengan parameter lebih dari satu dan nilai default
void tampilkanInfo(String nama, int nilai, {String bootcamp = "Mobile Development"}) {
  print("Nama Peserta: $nama");
  print("Bootcamp: $bootcamp");
  print("Nilai Akhir: $nilai");
  print("Status: ${nilai >= 70 ? "Lulus 🎉" : "Belum Lulus ❌"}");
}
