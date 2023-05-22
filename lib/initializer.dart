import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_quest/features/auth/dal/datasource/auth.datasource.interface.dart';

import 'core/dal/storage/getx_storage.dart';
import 'core/dal/storage/storage.interface.dart';
import 'core/inject.dart';
import 'features/auth/dal/datasource/auth.datasource.mock.dart';
import 'features/shared/loading/loading.controller.dart';
import 'features/shared/loading/loading.interface.dart';

class Initializer {
  static late final String initialRoute;

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _initScreenPreference();
      _initGlobalLoading();
      _initMockDatasourceDependencies();
      await _initStorage();
    } catch (err) {
      rethrow;
    }
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void _initGlobalLoading() {
    final loading = LoadingController();
    Inject.put<ILoadingController>(loading);
  }

  static void _initMockDatasourceDependencies() {
    final authDatasource = AuthDatasourceMock();
    Inject.put<IAuthDatasource>(authDatasource);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    final storage = GetxStorage(storage: GetStorage());
    Inject.put<IStorage>(storage);
  }
}
