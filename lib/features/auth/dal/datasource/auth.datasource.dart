import 'package:project_quest/features/auth/dal/dto/authenticate_user.body.dart';
import 'package:project_quest/features/auth/dal/dto/sign_up.body.dart';

import '../../../../core/abstractions/http_connect.interface.dart';
import '../dto/authenticate_user.response.dart';
import '../dto/sign_up.response.dart';
import 'auth.datasource.interface.dart';

class AuthDatasource implements IAuthDatasource {
  final IHttpConnect _connect;
  const AuthDatasource({required IHttpConnect connect}) : _connect = connect;

  @override
  Future<AuthenticateUserDataResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    final response = await _connect.post<AuthenticateUserResponse>(
      'users/login',
      body.toJson(),
      decoder: AuthenticateUserResponse.fromJson,
    );

    return response.payload!.data!;
  }

  @override
  Future<SignUpResponse> signUp(SignUpBody body) async {
    final response = await _connect.post<SignUpResponse>(
      'users',
      body.toJson(),
      decoder: SignUpResponse.fromJson,
    );

    return response.payload!;
  }
}
