import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../model/booking/booking_model.dart';

class CalenderController extends GetxController {
  Rx<DateTime> currentDate = DateTime.now().obs;
  RxList<Booking> bookingsList = <Booking>[].obs;

  Future<void> fetchBookingsList() async {
    try {
      CollectionReference bookingsCollection =
          FirebaseFirestore.instance.collection('Bookings');
      QuerySnapshot bookingSnapshot = await bookingsCollection.get();

      if (bookingSnapshot.docs.isNotEmpty) {
        List<Booking> bookings = bookingSnapshot.docs.map((doc) {
          return Booking.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();

        bookingsList.assignAll(bookings);
        print('ali');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error retrieving booking documents: $e');
    }
  }
}
