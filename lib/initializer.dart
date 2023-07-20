import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_quest/features/auth/dal/datasource/auth.datasource.interface.dart';

import 'core/constants/storage.constants.dart';
import 'core/dal/storage/getx_storage.dart';
import 'core/dal/storage/storage.interface.dart';
import 'core/i18n/pt_br.dart';
import 'core/i18n/translation.dart';
import 'core/inject.dart';
import 'features/auth/dal/datasource/auth.datasource.mock.dart';
import 'features/shared/loading/loading.controller.dart';
import 'features/shared/loading/loading.interface.dart';
import 'package:devicelocale/devicelocale.dart';

class Initializer {
  static late final String initialRoute;

  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _initScreenPreference();
      _initGlobalLoading();
      _initMockDatasourceDependencies();
      await _initStorage();
      await _initI18n();
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
}
