import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/style.dart';

class IndicatorWidget extends StatelessWidget {
  final int count;
  final int currentPage; // Pass the current page

  const IndicatorWidget({
    Key? key,
    required this.count,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        count: count,
        effect: SlideEffect(
          offset: 1,
          dotColor: Colors.grey,
          dotWidth: 20,
          dotHeight: 4,
          activeDotColor: mainColo,
          spacing: 15,
        ),
        controller: PageController(
            initialPage: currentPage), // Use the passed currentPage value
        onDotClicked: (index) {},
      ),
    );
  }
}
