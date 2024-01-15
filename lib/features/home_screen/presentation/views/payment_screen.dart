import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custem_text_form_faild.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen(
      {super.key, required this.bookingId, required this.amount});
  final String bookingId;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.24,
                decoration: const BoxDecoration(
                  gradient: gradientColor2,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Payment',
                        style: TextStyle(
                          fontSize: 25,
                          color: textColor2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: colorConter,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .10,
                    ),
                    CustemTextForm(
                      validator: (value) {
                        if (value == null) {
                          return 'error';
                        }
                        return null;
                      },
                      hintText: '',
                      title: 'Card Number',
                      onSave: (value) {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustemTextForm(
                            validator: (value) {
                              if (value == null) {
                                return 'error';
                              }
                              return null;
                            },
                            hintText: '',
                            title: 'Expiry Date',
                            onSave: (value) {},
                          ),
                        ),
                        Expanded(
                          child: CustemTextForm(
                            validator: (value) {
                              if (value == null) {
                                return 'error';
                              }
                              return null;
                            },
                            hintText: '',
                            title: 'CVV',
                            onSave: (value) {},
                          ),
                        ),
                      ],
                    ),
                    CustemTextForm(
                      validator: (value) {
                        if (value == null) {
                          return 'error';
                        }
                        return null;
                      },
                      hintText: '',
                      title: 'Name',
                      onSave: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  gradient: gradientColor2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width / 3.2,
                      color: Colors.white,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Pay',
                            style: TextStyle(
                              color: mainColo,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 15,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: mainColo,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '350jd',
                      style: TextStyle(
                        fontSize: 30,
                        color: textColor2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
