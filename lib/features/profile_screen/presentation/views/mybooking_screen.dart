import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reservation_farm/core/utils/style.dart';
import 'package:reservation_farm/features/profile_screen/presentation/views/widget/details_booking_screen.dart';

import '../../../home_screen/presentation/views/widget/app_bar.dart';
import '../../auth/booking_controller.dart';

class MyBookingScreen extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());

  MyBookingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'My Booking',
      ),
      body: Obx(() {
        return ListView.separated(
          itemCount: bookingController.bookings.length,
          itemBuilder: (context, index) {
            var booking = bookingController.bookings[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Get.to(DetailsBookingScreen(
                      index: index,
                    ));
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 4,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(booking.images?.first ?? ''),
                                fit: BoxFit.cover,
                                opacity: .8,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  booking.nameFarm ?? '',
                                  style: TextStyle(
                                    color: mainColo,
                                  ),
                                ),
                                Text(
                                  DateFormat('yyyy-MM-dd')
                                      .format(booking.bookingDate as DateTime),
                                  style: TextStyle(
                                    color: mainColo,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Color(0xffDDEFF8),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(51, 113, 140, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.004,
          ),
        );
      }),
    );
  }
}
