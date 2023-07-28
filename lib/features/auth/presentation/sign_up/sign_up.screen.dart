import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_quest/features/shared/loading/loading.widget.dart';
import 'package:project_quest/features/shared/primary_button.widget.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';

import '../../../../core/base/style/colors.dart';
import '../../../../core/base/utils/snackbar.util.dart';
import '../../../../core/domains/user/domain/exceptions/email_already_in_use.exception.dart';
import '../../../../core/navigation/routes.dart';
import '../../../shared/view_controller.interface.dart';
import '../../domain/bindings/sign_up/sign_up_controller.interface.dart';

class SignUpScreen extends ViewController<ISignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        backgroundColor: const Color(CColors.background),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  i18n.strings.signUp.title,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
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
      FocusScope.of(context).unfocus();
      await controller.signUp();
      if (context.mounted) {
        context.goNamed(Routes.login);
        showSuccessSnackbar(
          context: context,
          title: 'Sucesso!',
          message: 'Sua conta foi criada com sucesso!',
        );
      }
    } on EmailAlreadyInUseException catch (err) {
      showErrorSnackbar(context: context, err: err);
    }
  }
}
