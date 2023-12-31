import 'package:farms_reservation/core/utils/style.dart';
import 'package:farms_reservation/features/login_screen/auth/auth_login_controller.dart';
import 'package:farms_reservation/features/login_screen/presentation/views/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/widgets/custem_text_form_faild.dart';
import '../../core/widgets/custem_button_widget.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends GetWidget<AuthLogin> {
  LoginScreen({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.06,
          ),
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: gradientColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor2,
                    ),
                  )),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  CustemTextForm(
                    title: 'Email',
                    hintText: 'Enter Your Email',
                    onSave: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'error';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustemTextForm(
                    title: 'Password',
                    hintText: 'Enter Your Password',
                    onSave: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'error';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustemTextButton(
                        text: 'Forgot Password?',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustemButtonWidget(
                    title: 'Sign In',
                    onPressed: () {
                      formkey.currentState?.save();

                      if (formkey.currentState!.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    },
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
                  Row(
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
                        onTap: () {
                          controller.googleSignInMethod();
                        },
                        child: SvgPicture.asset(
                          'assets/images/google.svg',
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account'),
                      CustemTextButton(
                        text: 'Sign Up',
                        onTap: () {
                          Get.to(const RegisterScreen());
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
