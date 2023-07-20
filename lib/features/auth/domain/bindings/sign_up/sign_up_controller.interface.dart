import '../../../../../core/abstractions/controller.interface.dart';
import '../../../../../core/abstractions/field.interface.dart';

abstract class ISignUpController extends IController {
  IField<String> get userNameField;
  IField<String> get emailField;
  IField<String> get passwordField;
  IField<bool> get centralCheckField;
  IField<bool> get cashierCheckField;
  IField<bool> get deliverymanCheckField;
  IField<String> get centralField;

  Future<void> signUp();
}
