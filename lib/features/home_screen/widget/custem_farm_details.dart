import 'package:flutter/material.dart';

import '../../../core/utils/style.dart';

class CustemFarmDetails extends StatelessWidget {
  const CustemFarmDetails({
    super.key,
    required this.farmName,
    this.price = '',
    required this.location,
  });

  final String farmName;
  final String price;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              farmName,
              style: TextStyle(
                color: mainColo,
              ),
            ),
            const Spacer(),
            Text(
              location,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          '$price\nPer Day',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
