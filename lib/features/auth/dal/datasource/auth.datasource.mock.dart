import 'dart:convert';

import '../../../../core/utils/mock.util.dart';
import '../../domain/constants/auth_path_mocks.constants.dart';
import '../../domain/exceptions/user_or_password_incorrect.exception.dart';
import '../dto/authenticate_user.response.dart';
import 'auth.datasource.interface.dart';

class AuthDatasourceMock implements IAuthDatasource {
  @override
  Future<AuthenticateUserDataResponse> authenticateUser({
    required String login,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (login.toLowerCase() != 'katekko' || password != '123456') {
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

  Future<AuthenticateUserResponse> _getMock(String path) async {
    final file = await MockUtil.getMockFile(path);
    final response = AuthenticateUserResponse.fromJson(jsonDecode(file));

    return response;
  }
}
