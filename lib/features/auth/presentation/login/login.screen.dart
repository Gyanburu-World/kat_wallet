import 'package:flutter/material.dart';

import '../../../shared/loading/loading.widget.dart';
import '../../../shared/text_field.widget.dart';
import '../../../shared/view_controller.interface.dart';
import '../../domain/bindings/login/login_controller.interface.dart';
import '../../domain/exceptions/user_or_password_incorrect.exception.dart';

class LoginScreen extends ViewController<ILoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: const Text(
                  'LOGO',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              TextFieldWidget(label: 'Username', field: controller.loginField),
              const SizedBox(height: 20.0),
              TextFieldWidget(
                label: 'Password',
                field: controller.passwordField,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => authenticateUser(context),
                    child: const Text('Login'),
                  ),
                  TextButton(onPressed: () {}, child: const Text('Register?')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void authenticateUser(BuildContext context) async {
    try {
      await controller.authenticateUser();
    } on UserOrPasswordIncorrectException catch (err) {
      showDialog(
        context: context,
        builder: (ctx) => Dialog(
          child: SizedBox(
            width: 300,
            height: 30,
            child: Center(child: Text(err.failure.message)),
          ),
        ),
      );
    } catch (err) {
      throw Exception(err);
    }
  }
}
