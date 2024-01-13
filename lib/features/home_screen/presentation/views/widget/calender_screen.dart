import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custem_button_widget.dart';
import '../payment_screen.dart';
import 'app_bar.dart';
import 'custom_button_calender.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

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
              focusedDay: DateTime.now(),
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
                CustomButtonCalender(
                  text: '12 Hours Am',
                  textColor: textColor,
                  onPressed: () {},
                ),
                CustomButtonCalender(
                  text: '12 Hours pm',
                  textColor: textColor,
                  onPressed: () {},
                ),
                CustomButtonCalender(
                  text: '24 Hours ',
                  textColor: textColor,
                  onPressed: () {},
                ),
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
