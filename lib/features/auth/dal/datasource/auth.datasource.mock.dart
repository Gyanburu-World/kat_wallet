import 'dart:convert';
import 'dart:developer';

import '../../../../core/utils/mock.util.dart';
import '../../domain/exceptions/email_already_in_use.exception.dart';
import '../dto/authenticate_user.body.dart';
import '../dto/sign_up.body.dart';
import 'auth_path_mocks.constants.dart';
import '../../domain/exceptions/user_or_password_incorrect.exception.dart';
import '../dto/authenticate_user.response.dart';
import 'auth.datasource.interface.dart';

class AuthDatasourceMock implements IAuthDatasource {
  Future<AuthenticateUserResponse> _getMock(String path) async {
    final file = await MockUtil.getMockFile(path);
    final response = AuthenticateUserResponse.fromJson(jsonDecode(file));

    return response;
  }

  @override
  Future<AuthenticateUserDataResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (body.email.toLowerCase() != 'joaovixgon@gmail.com' ||
        body.password != 'qwe123') {
      final mock = await _getMock(
        AuthPathMocksConstants.authenticateUserFailure,
      );
      throw UserOrPasswordIncorrectException(failure: mock.error!);
    }

    final response = await _getMock(
      AuthPathMocksConstants.authenticateUserSuccess,
    );
    return response.data!;
  }

  @override
  Future<void> signUp(SignUpBody body) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (body.email == 'katekko@gmail.com') {
        final mock = await _getMock(
          AuthPathMocksConstants.signUpEmailAlreadyExists,
        );

        throw EmailAlreadyInUseException(failure: mock.error!);
      }

      log(
        '[Kat Delivery] Usuário cadastrado com sucesso!\n email:${body.email}, password:${body.email}',
      );
    } catch (err) {
      rethrow;
    }
  }
}
