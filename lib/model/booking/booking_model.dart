import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  List<String> bookingDurations;
  DateTime createdDate;
  DateTime bookingDate;
  String farmID;
  String userID;

  Booking({
    required this.bookingDurations,
    required this.createdDate,
    required this.bookingDate,
    required this.farmID,
    required this.userID,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingDurations: List<String>.from(json['bookingDurations'] ?? []),
      createdDate: (json['createdDate'] as Timestamp).toDate(),
      bookingDate: (json['bookingDate'] as Timestamp).toDate(),
      farmID: json['farmID'],
      userID: json['userID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingDurations': bookingDurations,
      'createdDate': FieldValue.serverTimestamp(),
      'bookingDate': FieldValue.serverTimestamp(),
      'farmID': farmID,
      'userID': userID,
    };
  }
}
