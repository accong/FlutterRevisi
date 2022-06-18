class Destination {
  String? image;
  String? nama;
  String? desc;
  String? location;
  String? price;
  String? catering;
  String? tourguide;

  Destination({
    this.image,
    this.nama,
    this.desc,
    this.location,
    this.price,
    this.catering,
    this.tourguide
  });

  Destination.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    nama = json['nama'];
    desc = json['desc'];
    location = json['location'];
    price = json['price'];
    catering = json['catering'];
    tourguide = json['tourguide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['nama'] = nama;
    data['desc'] = desc;
    data['location'] = location;
    data['price'] = price;
    data['catering'] = catering;
    data['tourguide'] = tourguide;
    return data;
  }
}
