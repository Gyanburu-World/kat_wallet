import '../../../../core/base/abstractions/controller.interface.dart';
import '../../../core/base/abstractions/field.interface.dart';

abstract class ITodoController extends IController {
  void init();

  IField<String> get title;
  IField<String> get description;
  IField<double> get value;
  IField<bool> get isRecurring;
  IField<bool> get isBilling;
  IField<DateTime> get doAt;

  Future<void> createTodo();
}
