import 'employee.dart';

void main() {
  // Membuat objek Employee dengan data karyawan
  var employee1 = Employee(101, "Yoga Pratama", "IT");
  var employee2 = Employee(102, "Andi Wijaya", "HR");
  var employee3 = Employee(103, "Siti Aisyah", "Finance");

  // Menampilkan data masing-masing employee
  print("=== Data Employee ===");
  employee1.display();
  print("-------------------");
  employee2.display();
  print("-------------------");
  employee3.display();
}
