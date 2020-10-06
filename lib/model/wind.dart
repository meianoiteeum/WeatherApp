class Wind {
  String speed;
  String deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'].toString();
    deg = json['deg'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}