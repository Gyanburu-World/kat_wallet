import 'package:flutter/material.dart';
import 'package:project_quest/features/auth/domain/exceptions/username_already_in_use.exception.dart';
import 'package:project_quest/features/shared/loading/loading.widget.dart';
import 'package:project_quest/features/shared/primary_button.widget.dart';
import 'package:project_quest/features/shared/text_field.widget.dart';

import '../../../../core/utils/snackbar.util.dart';
import '../../../shared/view_controller.interface.dart';
import '../../domain/bindings/sign_up/sign_up_controller.interface.dart';
import '../../domain/exceptions/email_already_in_use.exception.dart';
import 'widgets/checkbox.widget.dart';
import 'widgets/major_field.widget.dart';

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
                          label: i18n.strings.signUp.emailLabelField,
                          field: controller.emailField,
                        ),
                        const SizedBox(height: 16),
                        TextFieldWidget(
                          label: i18n.strings.signUp.passwordLabelField,
                          field: controller.passwordField,
                        ),
                        const SizedBox(height: 24),
                        CheckboxWidget(
                          field: controller.centralCheckField,
                          icon: Icons.content_paste_search_outlined,
                          label: i18n.strings.signUp.centralCheckboxLabel,
                        ),
                        CheckboxWidget(
                          field: controller.cashierCheckField,
                          icon: Icons.attach_money_outlined,
                          label: i18n.strings.signUp.cashierCheckboxLabel,
                        ),
                        CheckboxWidget(
                          field: controller.deliverymanCheckField,
                          icon: Icons.delivery_dining_outlined,
                          label: i18n.strings.signUp.deliverymanCheckboxLabel,
                        ),
                        const SizedBox(height: 8),
                        const CentralFieldWidget(),
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
    } on UsernameAlreadyInUseException catch (err) {
      showErrorSnackbar(context: context, err: err);
    } on EmailAlreadyInUseException catch (err) {
      showErrorSnackbar(context: context, err: err);
      rethrow;
    } catch (err) {
      rethrow;
    }
  }
}
