import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/login_screen/auth/auth_login_controller.dart';
import '../../core/utils/style.dart';
import '../../core/widgets/custem_button_widget.dart';
import '../../core/widgets/custem_text_form_faild.dart';
import '../../core/widgets/custem_text_title_app.dart';

class RegisterScreen extends GetWidget<AuthLogin> {
  RegisterScreen({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
              child: Form(
                key: formkey,
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
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      title: 'Full Name',
                      hintText: 'Enter Your Full Name',
                      onSave: (value) {
                        controller.name = value ?? '';
                      },
                    ),
                    CustemTextForm(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSave: (value) {
                        controller.email = value ?? '';
                      },
                      title: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                    CustemTextForm(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSave: (value) {
                        controller.password = value ?? '';
                      },
                      title: 'Password',
                      hintText: 'Enter Your Password',
                    ),
                    CustemTextForm(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone';
                        }
                        return null;
                      },
                      onSave: (value) {
                        controller.phone = value ?? '';
                      },
                      title: 'Mobile Phone',
                      hintText: 'Enter Your Mobile Phone',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                    CustemButtonWidget(
                      title: 'Sign Up',
                      onPressed: () {
                        formkey.currentState?.save();
                        if (formkey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassword();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
