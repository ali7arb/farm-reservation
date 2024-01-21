import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/home_screen/presentation/views/widget/app_bar.dart';

import '../../../../../core/widgets/custem_button_widget.dart';
import '../../../../../core/widgets/custem_text_form_faild.dart';
import '../../../auth/auth_login_controller.dart';

class ForgotPasswordScreen extends GetWidget<AuthLogin> {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Forgot Password',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustemTextForm(
                title: 'Email',
                hintText: 'Enter Your Email',
                onSave: (value) {
                  controller.email = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustemButtonWidget(
                title: 'Reset Password',
                onPressed: () {
                  formKey.currentState?.save();

                  if (formKey.currentState!.validate()) {
                    controller.forgotPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
