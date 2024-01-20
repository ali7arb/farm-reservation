import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/profile_screen/auth/profile_view_controller.dart';

import '../../../model/booking/booking_model.dart';

class BookingController extends GetxController {
  RxList<Booking> bookings = <Booking>[].obs;
  final ProfileViewController controller = Get.find<ProfileViewController>();

  @override
  void onInit() {
    super.onInit();
    fetchBookings(controller.userModel?.userId ?? '');
  }

  Future<void> fetchBookings(String userId) async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('Bookings')
          .where('userID', isEqualTo: userId)
          .get();

      bookings.clear();

      for (var doc in querySnapshot.docs) {
        Booking booking = Booking.fromJson(doc.id, doc.data());
        bookings.add(booking);
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching bookings: $error');
    }
  }
}
