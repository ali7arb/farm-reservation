import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustemSocialLogin extends StatelessWidget {
  const CustemSocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/images/Face.svg',
            height: 40,
            width: 40,
          ),
        ),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/images/google.svg',
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }
}
