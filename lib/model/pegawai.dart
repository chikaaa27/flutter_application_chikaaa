class Pegawai {
  int? id;
  String namaPegawai;
  String nipPegawai;
  DateTime tanggalLahir;
  String nomorTelepon;
  String email;
  String password;

  Pegawai(
      {this.id,
      required this.namaPegawai,
      required this.nipPegawai,
      required this.tanggalLahir,
      required this.nomorTelepon,
      required this.email,
      required this.password});

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
      id: json["id"],
      namaPegawai: json["nama_pegawai"],
      nipPegawai: json["nip_pegawai"],
      tanggalLahir: json["tanggal_lahir"],
      nomorTelepon: json["nomor_telepon"],
      email: json["email"],
      password: json["password"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_pegawai": namaPegawai,
        "nip_pegawai": nipPegawai,
        "tanggal_lahir": tanggalLahir,
        "nomor_telepon": nomorTelepon,
        "email": email,
        "password": password
      };
}
