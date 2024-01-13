import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reservation_farm/features/login_screen/presentation/views/widgets/text_button.dart';
import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custem_text_form_faild.dart';
import '../../../../core/widgets/custem_button_widget.dart';
import '../../../register_screen/register_screen.dart';
import '../../auth/auth_login_controller.dart';

class LoginScreen extends GetWidget<AuthLogin> {
  LoginScreen({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.06,
        ),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: gradientColor,
        ),
        child: SingleChildScrollView(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
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
                    height: MediaQuery.of(context).size.height * .001,
                  ),
                  CustemTextForm(
                    title: 'Password',
                    hintText: 'Enter Your Password',
                    onSave: (value) {
                      controller.password = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .001,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.facebookSignInMethod();
                        },
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account'),
                      CustemTextButton(
                        text: 'Sign Up',
                        onTap: () {
                          Get.to(RegisterScreen());
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
