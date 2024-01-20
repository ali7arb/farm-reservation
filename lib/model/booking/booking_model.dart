import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String? bookingId;
  String? bookingDuration;
  DateTime? createdDate;
  DateTime? bookingDate;
  String? farmID;
  String? userID;
  String? nameFarm;
  String? location;
  List<String>? images;

  Booking({
    this.bookingId,
    this.bookingDuration,
    this.createdDate,
    this.bookingDate,
    this.farmID,
    this.userID,
    this.nameFarm,
    this.location,
    this.images,
  });

  factory Booking.fromJson(String bookingId, Map<String, dynamic> json) {
    return Booking(
      bookingId: bookingId,
      bookingDuration: json['bookingDuration'] ?? '',
      createdDate:
          (json['createdDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      bookingDate:
          (json['bookingDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      farmID: json['farmID'] ?? '',
      userID: json['userID'] ?? '',
      nameFarm: json['nameFarm'] ?? '',
      location: json['location'] ?? '',
      images: json['images'] != null ? List<String>.from(json['images']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingDuration': bookingDuration,
      'createdDate': Timestamp.fromDate(createdDate!),
      'bookingDate': Timestamp.fromDate(bookingDate!),
      'farmID': farmID,
      'userID': userID,
      'nameFarm': nameFarm,
      'location': location,
      'images': images,
    };
  }
}
