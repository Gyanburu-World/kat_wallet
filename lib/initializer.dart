import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

import 'core/base/abstractions/http_connect.interface.dart';
import 'core/base/constants/storage.constants.dart';
import 'core/base/dal/storage/getx_storage.dart';
import 'core/base/dal/storage/storage.interface.dart';
import 'core/base/models/http_connect.dart';
import 'core/base/models/token_client.dart';
import 'core/domains/todo/dal/datasource/todo.datasource.interface.dart';
import 'core/domains/todo/dal/datasource/todo.datasource.mock.dart';
import 'core/domains/user/dal/datasource/user.datasource.dart';
import 'core/domains/user/dal/datasource/user.datasource.interface.dart';
import 'core/domains/user/domain/constants/user_storage.constants.dart';
import 'core/i18n/pt_br.dart';
import 'core/i18n/translation.dart';
import 'core/inject.dart';
import 'features/shared/loading/loading.controller.dart';
import 'features/shared/loading/loading.interface.dart';

class Initializer {
  static late final String initialRoute;

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _initScreenPreference();
      _initGlobalLoading();
      await _initStorage();
      await _initI18n();
      await _initConnect();
      _initDatasourceDependencies();
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

  static void _initDatasourceDependencies() {
    final connect = Inject.find<IHttpConnect>();
    final authDatasource = UserDatasource(connect: connect);
    // final authDatasource = AuthDatasourceMock();
    Inject.put<IUserDatasource>(authDatasource);

    final todoDatasource = TodoDatasourceMock();
    Inject.put<ITodoDatasource>(todoDatasource);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    final storage = GetxStorage(storage: GetStorage());
    Inject.put<IStorage>(storage);
  }

  static Future<void> _initI18n() async {
    StringsTranslations getCurrentI18n(String locale) {
      switch (locale) {
        case PtBrStringsTranslations.getLocale:
          return PtBrStringsTranslations();
        default:
          return PtBrStringsTranslations();
      }
    }

    final storage = Inject.find<IStorage>();
    final locale = await storage.read(StorageConstants.locale);

    late StringsTranslations i18n;
    if (locale != null) {
      i18n = getCurrentI18n(locale);
    } else {
      final currentLocale = await Devicelocale.currentLocale;
      if (currentLocale != null) {
        i18n = getCurrentI18n(currentLocale);
      } else {
        i18n = PtBrStringsTranslations();
      }
    }

    Inject.put<StringsTranslations>(i18n);
  }

  static Future<void> _initConnect() async {
    final storage = Inject.find<IStorage>();
    final token = await storage.read(UserStorageConstants.tokenAuthorization);
    final client = TokenClient(token);
    final connect = HttpConnect(client);
    Inject.put<IHttpConnect>(connect);
  }
}
