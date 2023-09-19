class UserModel {
  late int id;
  late String username;
  late String email;
  late String tanggallahir;
  late String jeniskelamin;
  late String alamat;
  late String gambar;
  late String token;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.tanggallahir,
    required this.jeniskelamin,
    required this.alamat,
    required this.gambar,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    tanggallahir = json['tanggallahir'];
    jeniskelamin = json['jeniskelamin'];
    alamat = json['alamat'];
    gambar = json['gambar'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'tanggallahir': tanggallahir,
      'jeniskelamin': jeniskelamin,
      'alamat': alamat,
      'gambar': gambar,
      'token': token,
    };
  }
}
