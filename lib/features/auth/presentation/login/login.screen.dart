import 'package:flutter/material.dart';
import 'package:project_quest/core/utils/snackbar.util.dart';
import 'package:project_quest/features/shared/primary_button.widget.dart';

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
        backgroundColor: const Color(0xFF161616),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                i18n.strings.login.userNameLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                label: i18n.strings.login.userNameLabel,
                field: controller.loginField,
                useLabelAsHint: true,
              ),
              const SizedBox(height: 20.0),
              Text(
                i18n.strings.login.passwordLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                label: i18n.strings.login.passwordLabel,
                field: controller.passwordField,
                useLabelAsHint: true,
              ),
              const SizedBox(height: 20.0),
              PrimaryButtonWidget(
                text: i18n.strings.login.loginButtonLabel,
                onPressed: authenticateUser,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void authenticateUser(BuildContext context) async {
    try {
      FocusScope.of(context).unfocus();
      await controller.authenticateUser();
    } on UserOrPasswordIncorrectException catch (err) {
      showErrorSnackbar(context: context, err: err);
    } catch (err) {
      throw Exception(err);
    }
  }
}
