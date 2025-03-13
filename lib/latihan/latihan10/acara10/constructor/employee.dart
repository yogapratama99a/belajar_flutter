class Employee {
  int id;
  String name;
  String department;

  // Constructor
  Employee(this.id, this.name, this.department);

  // Method untuk menampilkan data
  void display() {
    print("ID: $id");
    print("Nama: $name");
    print("Departemen: $department");
  }
}
