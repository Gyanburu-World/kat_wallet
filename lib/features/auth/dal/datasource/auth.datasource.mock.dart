import 'dart:convert';
import 'dart:developer';

import 'package:project_quest/features/auth/domain/exceptions/central_not_exists.exception.dart';

import '../../../../core/utils/mock.util.dart';
import '../../domain/exceptions/email_already_in_use.exception.dart';
import '../../domain/exceptions/username_already_in_use.exception.dart';
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
  Future<AuthenticateUserDataResponse> authenticateUser({
    required String login,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (login.toLowerCase() != 'katekko' || password != 'qwe123') {
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
  Future<void> signUp({
    required String username,
    required String password,
    required String email,
    required String? centralUser,
    required bool isCentral,
    required bool isCashier,
    required bool isDeliveryman,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (email == 'katekko@gmail.com') {
        final mock = await _getMock(
          AuthPathMocksConstants.signUpEmailAlreadyExists,
        );

        throw EmailAlreadyInUseException(failure: mock.error!);
      } else if (username == 'katekko') {
        final mock = await _getMock(
          AuthPathMocksConstants.signUpUsernameAlreadyExists,
        );

        throw UsernameAlreadyInUseException(failure: mock.error!);
      } else if (centralUser != null && centralUser != 'katekko') {
        final mock = await _getMock(
          AuthPathMocksConstants.signUpCentralNotExists,
        );

        throw CentralNotExistsException(failure: mock.error!);
      }

      log(
        '[Kat Delivery] Usuário cadastrado com sucesso!\nuser:$username, password:$password, email:$email, centralLink:$centralUser, isCentral:$isCentral, isCashier:$isCashier, isDeliveryman:$isDeliveryman',
      );
    } catch (err) {
      rethrow;
    }
  }
}
