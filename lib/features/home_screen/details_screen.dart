import 'package:farms_reservation/core/utils/style.dart';
import 'package:farms_reservation/core/widgets/custem_button_widget.dart';
import 'package:farms_reservation/features/home_screen/widget/calender_screen.dart';
import 'package:farms_reservation/features/home_screen/widget/custem_text_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widget/app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Details',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustemTextName(
              name: 'North Farm',
              color: mainColo,
              size: 25,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/northfarm.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Center(
              child: SmoothPageIndicator(
                count: 6,
                effect: SlideEffect(
                  offset: 1,
                  dotColor: Colors.grey,
                  dotWidth: 20,
                  dotHeight: 4,
                  activeDotColor: mainColo,
                  spacing: 15,
                ), // your preferred effect
                onDotClicked: (index) {}, controller: PageController(),
              ),
            ),
            const Spacer(),
            CustemButtonWidget(
              onPressed: () {
                Get.to(const CalenderScreen());
              },
              title: 'Book',
              textColor: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
