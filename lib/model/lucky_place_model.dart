class LuckyPlace {
  String? tiTle;
  String? placeId;
  String? description;
  String? dateTime;

  LuckyPlace({this.tiTle, this.placeId, this.description, this.dateTime});

  LuckyPlace.fromJson(Map<String, dynamic> json) {
    tiTle = json['ti\$tle' ''].toString();
    placeId = json['placeId'].toString();
    description = json['description'].toString();
    dateTime = json['dateTime'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ti\$tle'] = this.tiTle;
    data['placeId'] = this.placeId;
    data['description'] = this.description;
    data['dateTime'] = this.dateTime;
    return data;
  }
}
