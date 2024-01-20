import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custem_button_widget.dart';
import '../../../../../model/booking/booking_model.dart';
import '../../../../../model/farms/farms_model.dart';
import '../../../../profile_screen/auth/profile_view_controller.dart';
import '../../../auth/calender_controller.dart';
import '../payment_screen.dart';
import 'app_bar.dart';
import 'custom_button_calender.dart';

class CalendarScreen extends StatelessWidget {
  final CalendarController controller = Get.put(CalendarController());
  final FarmModel farm;
  final ProfileViewController userController = Get.put(ProfileViewController());

  CalendarScreen({
    super.key,
    required this.farm,
  });

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
            Obx(() => TableCalendar(
                  locale: 'en_US',
                  firstDay: DateTime.utc(2023, 12, 19),
                  lastDay: DateTime.utc(2030, 12, 30),
                  focusedDay: controller.currentDate.value,
                  availableGestures: AvailableGestures.all,
                  onDaySelected: (selectedDay, focusedDay) async {
                    controller.currentDate.value = selectedDay;
                    await controller.getBookingsForDate(focusedDay);
                    await controller.updateAvailableDurations();
                  },
                  selectedDayPredicate: (day) =>
                      isSameDay(day, controller.currentDate.value),
                )),
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
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...controller.availableDurations.map((duration) {
                      return CustomButtonCalender(
                        text: duration,
                        textColor: textColor,
                        onPressed: () {
                          controller.selectedDuration.value = duration;
                        },
                      );
                    }).toList(),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            CustemButtonWidget(
              title: 'Select Time',
              onPressed: () async {
                List<Booking> existingBookings = await controller
                    .getBookingsForDate(controller.currentDate.value);

                if (existingBookings.isEmpty) {
                  Booking newBooking = Booking(
                    bookingDuration: controller.selectedDuration.value,
                    createdDate: DateTime.now(),
                    bookingDate: controller.currentDate.value,
                    farmID: farm.id ?? '',
                    userID: userController.userModel?.userId ?? '',
                    bookingId: '',
                    nameFarm: farm.name ?? '',
                    location: farm.location ?? '',
                    images: farm.images,
                  );

                  DocumentReference bookingReference = await FirebaseFirestore
                      .instance
                      .collection('Bookings')
                      .add(newBooking.toJson());

                  Get.to(() => PaymentScreen(), arguments: {
                    'bookingId': bookingReference.id,
                    'amount': 350,
                  });
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
