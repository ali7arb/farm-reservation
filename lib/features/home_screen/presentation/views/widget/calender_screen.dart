import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custem_button_widget.dart';
import '../payment_screen.dart';
import 'app_bar.dart';
import 'custom_button_calender.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime currentDate = DateTime.now();
  bool isLoading = false;
  List<String> durations = ["12AM", "12PM", "24"];

  Future<Booking?> getBookingDocument(String bookingId) async {
    try {
      CollectionReference bookingsCollection =
          FirebaseFirestore.instance.collection('Bookings');
      DocumentSnapshot bookingSnapshot =
          await bookingsCollection.doc(bookingId).get();
      if (bookingSnapshot.exists) {
        Booking booking =
            Booking.fromJson(bookingSnapshot.data() as Map<String, dynamic>);
        return booking;
      } else {
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error retrieving booking document: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Calender',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              locale: 'en_US',
              firstDay: DateTime.utc(2023, 12, 19),
              lastDay: DateTime.utc(2030, 12, 30),
              focusedDay: currentDate,
              availableGestures: AvailableGestures.all,
              onDaySelected: (selectedDay, focusedDay) async {
                setState(() {
                  currentDate = selectedDay;
                });
                Booking? booking =
                    await getBookingDocument("PLXUgCc4eGVWZEzQNfRQ");
                if (booking != null) {
                  // ignore: avoid_print
                  print('Booking Duration: ${booking.bookingDuration}');
                  // ignore: avoid_print
                  print('Created Date: ${booking.createdDate}');
                  var index = durations.indexWhere((element) {
                    return booking.bookingDuration == element;
                  });
                  setState(() {
                    durations.removeAt(index);
                  });
                } else {
                  // ignore: avoid_print
                  print('Booking document not found.');
                }
              },
              selectedDayPredicate: (day) => isSameDay(day, currentDate),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            const Text(
              'Available Time',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...durations.map((duration) {
                  return CustomButtonCalender(
                    text: duration,
                    textColor: textColor,
                    onPressed: () {},
                  );
                }).toList(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            CustemButtonWidget(
              title: 'Select Time',
              onPressed: () {
                Get.to(const PaymentScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Booking {
  String bookingDuration;
  DateTime createdDate;
  DateTime bookingDate;
  String farmID;
  String userID;

  Booking({
    required this.bookingDuration,
    required this.createdDate,
    required this.bookingDate,
    required this.farmID,
    required this.userID,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingDuration: json['bookingDuration'],
      createdDate: (json['createdDate'] as Timestamp).toDate(),
      bookingDate: (json['bookingDate'] as Timestamp).toDate(),
      farmID: json['farmID'],
      userID: json['userID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingDuration': bookingDuration,
      'createdDate': Timestamp.fromDate(createdDate),
      'bookingDate': Timestamp.fromDate(bookingDate),
      'farmID': farmID,
      'userID': userID,
    };
  }
}

enum BookingsDuration {
  am12,
  pm12,
  full24,
}
