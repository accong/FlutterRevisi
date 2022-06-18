class Tourguide {
  String? nama;
  String? phone;
  String? email;
  String? location;

  Tourguide({this.nama, this.phone, this.email, this.location});

  Tourguide.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    phone = json['phone'];
    email = json['email'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['phone'] = phone;
    data['email'] = email;
    data['location'] = location;
    return data;
  }
}
