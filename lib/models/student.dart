class Student {
  final int id;
  final String name;
  final String address;
  final String foto;
  Student({
    required this.id,
    required this.name,
    required this.address,
    required this.foto,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
      other.id == id &&
      other.name == name &&
      other.address == address &&
      other.foto == foto;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      address.hashCode ^
      foto.hashCode;
  }
}

final List<Student> students = [
  Student(
      id: 11,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 12,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 13,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 14,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 15,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 16,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 17,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 18,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 19,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 20,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 21,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 22,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 23,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 24,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
  Student(
      id: 25,
      name: 'Rozali',
      address: 'jalan apel',
      foto: 'assets/images/poto.png'),
];
