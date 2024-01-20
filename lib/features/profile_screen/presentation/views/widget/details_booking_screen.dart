import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/app_bar.dart';

import '../../../auth/booking_controller.dart';

class DetailsBookingScreen extends StatelessWidget {
  DetailsBookingScreen({
    super.key,
  });

  final BookingController bookingController = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: 'Booking Details',
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
