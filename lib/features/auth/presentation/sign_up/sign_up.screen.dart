import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:project_quest/core/abstractions/custom_exception.interface.dart';
import 'package:project_quest/features/auth/domain/exceptions/username_already_in_use.exception.dart';
import 'package:project_quest/features/shared/loading/loading.widget.dart';
import 'package:project_quest/features/shared/primary_button.widget.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';

import '../../../shared/view_controller.interface.dart';
import '../../domain/bindings/sign_up/sign_up_controller.interface.dart';
import '../../domain/exceptions/email_already_in_use.exception.dart';

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
                Text(
                  i18n.strings.signUp.title,
                  style: const TextStyle(
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
                          label: i18n.strings.signUp.usernameLabelField,
                          field: controller.userNameField,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          label: i18n.strings.signUp.nicknameLabelField,
                          field: controller.nicknameField,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          label: i18n.strings.signUp.emailLabelField,
                          field: controller.emailField,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          label: i18n.strings.signUp.passwordLabelField,
                          field: controller.passwordField,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                PrimaryButtonWidget(
                  text: i18n.strings.signUp.signUpButton,
                  onPressed: onSignUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSignUp(BuildContext context) async {
    try {
      await controller.signUp();
    } on UsernameAlreadyInUseException catch (err) {
      showErrorSnackbar(context: context, err: err);
    } on EmailAlreadyInUseException catch (err) {
      showErrorSnackbar(context: context, err: err);
      rethrow;
    } catch (err) {
      rethrow;
    }
  }

  void showErrorSnackbar({
    required BuildContext context,
    required CustomException err,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Oh dear!',
        message: err.failure.message,
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
