class Info {
  String? name;
  String? photo;
  String? menuphoto;
  String? weekdays;
  String? weekends;
  String? adress;
  String? phone;
  List<String>? photos;

  Info(
      {this.name,
      this.photo,
      this.menuphoto,
      this.adress,
      this.weekdays,
      this.weekends,
      this.phone,
      this.photos});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
      name: json["name"],
      photo: json["photo"],
      menuphoto: json["menuphoto"],
      weekdays: json["weekdays"],
      weekends: json["weekend"],
      adress: json["adress"],
      phone: json["phone"],
      photos: json["photos"] == null ? null : List<String>.from(json["photos"].map((x) => x)));
}
