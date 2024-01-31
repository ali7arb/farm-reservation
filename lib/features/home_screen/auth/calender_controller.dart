import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/model/farms/farms_model.dart';
import '../../../model/booking/booking_model.dart';

class CalendarController extends GetxController {
  Rx<DateTime> currentDate = DateTime.now().obs;
  RxList<String> availableDurations = <String>[].obs;
  RxString selectedDuration = ''.obs;
  RxList<Booking> existingBookings = <Booking>[].obs;
  FarmModel farmModel = FarmModel();

  Future<void> updateAvailableDurations() async {
    // List<String> durations = ["12AM", "12PM", "24"];
    //availableDurations.assignAll(durations);
    availableDurations.clear();

    availableDurations.addAll([
      '12AM',
      '12PM',
      '24',
    ]);

    for (Booking booking in existingBookings) {
      availableDurations.remove(booking.bookingDuration);
    }
  }

  Future<List<Booking>> getBookingsForDate(DateTime date) async {
    // ignore: avoid_print
    print('fetching bookings:$date');
    try {
      CollectionReference bookingsCollection =
          FirebaseFirestore.instance.collection('Bookings');

      QuerySnapshot bookingSnapshot =
          await bookingsCollection.where('bookingDate', isEqualTo: date).get();

      if (bookingSnapshot.docs.isNotEmpty) {
        List<Booking> bookings = bookingSnapshot.docs.map((doc) {
          return Booking.fromJson(doc.id, doc.data() as Map<String, dynamic>);
        }).toList();

        // ignore: avoid_print
        print("Fetched bookings: $bookings");

        existingBookings.assignAll(bookings);
        return bookings;
      } else {
        existingBookings.clear();
        return [];
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error retrieving bookings for date: $e');
      existingBookings.clear();
      return [];
    }
  }
}
