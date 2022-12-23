class SiteDataModels {
  SiteDataModels({
      this.description, 
      this.latitude, 
      this.longitude, 
      this.name, 
      this.gMapsPlace, 
      this.pictures,});

  SiteDataModels.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    gMapsPlace = json['gMapsPlace'];
    pictures = json['pictures'] != null ? json['pictures'].cast<String>() : [];
  }
  String? description;
  double? latitude;
  double? longitude;
  String? name;
  String? gMapsPlace;
  List<String>? pictures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['name'] = name;
    map['gMapsPlace'] = gMapsPlace;
    map['pictures'] = pictures;
    return map;
  }

}