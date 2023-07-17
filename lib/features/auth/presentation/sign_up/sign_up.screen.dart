import 'package:flutter/material.dart';
import 'package:project_quest/features/shared/loading/loading.widget.dart';
import 'package:project_quest/features/shared/primary_button.widget.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';

import '../../../shared/view_controller.interface.dart';
import '../../domain/bindings/sign_up/sign_up_controller.interface.dart';

class SignUpScreen extends ViewController<ISignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        backgroundColor: const Color(0xFF161616),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          label: 'Username',
                          field: controller.userNameField,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          label: 'Name',
                          field: controller.nameField,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          label: 'Email',
                          field: controller.emailField,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          label: 'Password',
                          field: controller.passwordField,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                PrimaryButtonWidget(text: 'Sign UP', onPressed: onSignUp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSignUp(BuildContext context) {
    try {
      controller.signUp();
    } catch (err) {
      rethrow;
    }
  }
}
