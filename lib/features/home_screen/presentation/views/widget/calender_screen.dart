import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/model/farms/farms_model.dart';
import 'package:reservation_farm/model/users/user_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custem_button_widget.dart';
import '../payment_screen.dart';
import 'app_bar.dart';
import 'custom_button_calender.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime currentDate = DateTime.now();
  List<String> durations = ["12AM", "12PM", "24"];
  String? selectedDuration;

  Future<List<Booking>> getBookingsForDate(DateTime selectedDay) async {
    List<Booking> bookings = [];

    try {
      CollectionReference bookingsCollection =
          FirebaseFirestore.instance.collection('Bookings');

      QuerySnapshot bookingSnapshot = await bookingsCollection
          .where('bookingDate', isEqualTo: selectedDay)
          .get();

      if (bookingSnapshot.docs.isNotEmpty) {
        bookings = bookingSnapshot.docs.map((doc) {
          return Booking.fromJson(doc.id, doc.data() as Map<String, dynamic>);
        }).toList();
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error retrieving bookings for date: $e');
    }

    return bookings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Calendar',
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

                List<Booking> bookings = await getBookingsForDate(selectedDay);
                // Handle the list of bookings for the selected date
                // ignore: avoid_print
                print('Bookings for ${selectedDay.toString()}: $bookings');
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
                    onPressed: () {
                      setState(() {
                        selectedDuration = duration;
                      });
                    },
                  );
                }).toList(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            CustemButtonWidget(
              title: 'Select Time',
              onPressed: () async {
                FarmModel farm = FarmModel();
                UserModel user = UserModel();

                List<Booking> existingBookings =
                    await getBookingsForDate(currentDate);

                if (selectedDuration != null && existingBookings.isEmpty) {
                  Booking newBooking = Booking(
                    bookingDuration: selectedDuration!,
                    createdDate: DateTime.now(),
                    bookingDate: currentDate,
                    farmID: farm.id ?? '',
                    userID: user.userId ?? '',
                    bookingId: '',
                  );

                  DocumentReference bookingReference = await FirebaseFirestore
                      .instance
                      .collection('Bookings')
                      .add(newBooking.toJson());

                  Get.to(() => PaymentScreen(
                        bookingId: bookingReference.id,
                        amount: 350,
                      ));
                } else {
                  Get.snackbar(
                    "Already Booked",
                    "Please choose another time slot",
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Booking {
  String bookingId;
  String bookingDuration;
  DateTime createdDate;
  DateTime bookingDate;
  String farmID;
  String userID;

  Booking({
    required this.bookingId,
    required this.bookingDuration,
    required this.createdDate,
    required this.bookingDate,
    required this.farmID,
    required this.userID,
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
