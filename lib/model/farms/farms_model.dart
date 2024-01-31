import 'package:get/get.dart';

class FarmModel {
  String? id;
  String? name;
  String? location;
  String? description;
  RxBool? isFavorite;
  List<String>? images;
  List<String>? price;
  String? latitude;
  String? longitude;

  FarmModel({
    this.id,
    this.name,
    this.location,
    this.description,
    this.price,
    this.latitude,
    this.longitude,
    bool? isFavorite,
    this.images,
  }) {
    this.isFavorite =
        isFavorite?.obs ?? false.obs; // Use obs to make it observable
  }

  factory FarmModel.fromJson(Map<String, dynamic> json) {
    return FarmModel(
      id: json['id'],
      name: json['name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      location: json['location'],
      description: json['description'],
      price: json['price'] != null ? List<String>.from(json['price']) : null,
      isFavorite: json['isFavorite'],
      images: json['image'] != null ? List<String>.from(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['name'] = name;
    data['location'] = location;
    data['description'] = description;
    data['isFavorite'] = isFavorite;
    data['image'] = images;
    data['price'] = price;
    return data;
  }
}
