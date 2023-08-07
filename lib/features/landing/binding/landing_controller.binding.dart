import '../../../../../core/inject.dart';
import '../presentation/landing.controller.dart';
import 'landing_controller.interface.dart';

class LandingControllerBinding {
  static void inject() {
    Inject.injectController<ILandingController>(makeLandingController);
  }

  static void dipose() {
    Inject.disposeController<ILandingController>();
  }
}

ILandingController makeLandingController() {
  return LandingController();
}
