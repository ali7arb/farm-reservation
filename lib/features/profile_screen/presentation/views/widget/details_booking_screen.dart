import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reservation_farm/core/utils/style.dart';
import 'package:reservation_farm/core/utils/text_styles.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/app_bar.dart';
import '../../../../../model/booking/booking_model.dart';
import '../../../auth/booking_controller.dart';

class DetailsBookingScreen extends StatelessWidget {
  final int index;
  DetailsBookingScreen({
    super.key,
    required this.index,
  });

  final BookingController bookingController = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    Booking booking = bookingController.bookings[index];
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Booking Details',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .05,
          horizontal: MediaQuery.of(context).size.width * .02,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .02,
            horizontal: MediaQuery.of(context).size.width * .02,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: gradientColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Styles.textstyle28(booking.nameFarm ?? '', mainColo),
              Styles.textstyle16bold(
                  bookingController.controller.userModel?.name ?? '',
                  Colors.black),
              Styles.textstyle16bold(
                  'Booking Date: ${DateFormat('EEEE').format(booking.bookingDate!)}',
                  Colors.black),
              Styles.textstyle16bold(
                  'Booking Date: ${DateFormat('dd/MM/yyyy').format(booking.bookingDate!)}',
                  Colors.black),
              if (booking.bookingDuration == '12PM')
                Styles.textstyle16bold('From 11PM To 8Am', Colors.black),
              if (booking.bookingDuration == '12AM')
                Styles.textstyle16bold('From 10AM To 9Am', Colors.black),
              if (booking.bookingDuration == '24')
                Styles.textstyle16bold('From 10AM To 8Am', Colors.black),
              if (booking.bookingDuration == '12PM')
                Styles.textstyle16bold('130 JD', Colors.black),
              if (booking.bookingDuration == '12AM')
                Styles.textstyle16bold('130 JD', Colors.black),
              if (booking.bookingDuration == '24')
                Styles.textstyle16bold('220 JD', Colors.black),
              Styles.textstyle16bold(
                  'Note: Refundable deposit (50 JD)', Colors.red),
              GestureDetector(
                onTap: () {},
                child: Styles.textstyle16bold(booking.location ?? '', mainColo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
