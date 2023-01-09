class kabupaten {
  String id;
  String nama;
  String luas;

  kabupaten({required this.id, required this.nama, required this.luas});

  factory kabupaten.fromJson(Map<String, dynamic> kirim) => kabupaten(
      id: kabupaten['id'], nama: kabupaten['nama'], luas: kabupaten['luas']);
}
