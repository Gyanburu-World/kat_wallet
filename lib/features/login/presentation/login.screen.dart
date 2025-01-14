import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_quest/features/shared/primary_button.widget.dart';

import '../../../../core/base/style/colors.dart';
import '../../../../core/base/utils/snackbar.util.dart';
import '../../../../core/domains/user/domain/exceptions/user_or_password_incorrect.exception.dart';
import '../../../../core/navigation/routes.dart';
import '../../shared/loading/loading.widget.dart';
import '../../shared/text_field.widget.dart';
import '../../shared/view_controller.interface.dart';
import '../binding/login_controller.interface.dart';

class LoginScreen extends ViewController<ILoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        backgroundColor: const Color(CColors.background),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      i18n.strings.login.title,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 32,
                              ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
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
      if (context.mounted) context.goNamed(Routes.home);
    } on UserOrPasswordIncorrectException catch (err) {
      showErrorSnackbar(context: context, err: err);
    }
  }
}
