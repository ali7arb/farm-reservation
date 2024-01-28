import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/core/utils/text_styles.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/app_bar.dart';
import 'package:reservation_farm/model/farms/farms_model.dart';

import '../../../auth/booking_controller.dart';

class DetailsBookingScreen extends StatelessWidget {
  DetailsBookingScreen({
    super.key,
  });

  final BookingController bookingController = Get.put(BookingController());
  final FarmModel farm = FarmModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Booking Details',
      ),
      body: Column(
        children: [
          Styles.textstyle16(farm.name ?? '', Colors.black),
        ],
      ),
    );
  }
}
