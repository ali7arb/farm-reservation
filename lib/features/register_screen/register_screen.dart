import 'package:farms_reservation/core/utils/style.dart';
import 'package:farms_reservation/core/widgets/custem_text_form_faild.dart';
import 'package:farms_reservation/core/widgets/custem_button_widget.dart';
import 'package:farms_reservation/core/widgets/custem_text_title_app.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custem_social_login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: gradientColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustemTextTitleAppBar(
                    text: 'Create New Account',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  CustemTextForm(
                    validator: (value) {
                      if (value == null) {
                        return 'error';
                      }
                    },
                    title: 'Full Name',
                    hintText: 'Enter Your Full Name',
                    onSave: (value) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustemTextForm(
                    validator: (value) {
                      if (value == null) {
                        return 'error';
                      }
                    },
                    onSave: (value) {},
                    title: 'Password',
                    hintText: 'Enter Your Password',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustemTextForm(
                    validator: (value) {
                      if (value == null) {
                        return 'error';
                      }
                    },
                    onSave: (value) {},
                    title: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustemTextForm(
                    validator: (value) {
                      if (value == null) {
                        return 'error';
                      }
                    },
                    onSave: (value) {},
                    title: 'Mobile Phone',
                    hintText: 'Enter Your Mobile Phone',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustemButtonWidget(
                    title: 'Sign Up',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustemSocialLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
