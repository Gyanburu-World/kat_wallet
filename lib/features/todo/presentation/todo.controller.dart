import 'package:project_quest/core/base/abstractions/field.interface.dart';
import 'package:project_quest/features/todo/usecases/create_todo.usecase.dart';

import '../../../core/domains/todo/domain/models/todo.model.dart';
import '../../shared/loading/loading.interface.dart';
import '../binding/todo_controller.interface.dart';

class TodoController implements ITodoController {
  final ILoadingController loading;
  final CreateTodoUsecase createTodoUsecase;

  final IField<String> _titleField;
  final IField<String> _descriptionField;
  final IField<double> _valueField;
  final IField<bool> _isRecurringField;
  final IField<bool> _isBillingField;
  final IField<DateTime> _doAtField;

  @override
  IField<String> get description => _descriptionField;

  @override
  IField<DateTime> get doAt => _doAtField;

  @override
  IField<bool> get isBilling => _isBillingField;

  @override
  IField<bool> get isRecurring => _isRecurringField;

  @override
  IField<String> get title => _titleField;

  @override
  IField<double> get value => _valueField;

  TodoModel? updateTodo;

  TodoController({
    required this.loading,
    required this.createTodoUsecase,
    required this.updateTodo,
    required IField<String> titleField,
    required IField<String> descriptionField,
    required IField<double> valueField,
    required IField<bool> isRecurringField,
    required IField<bool> isBillingField,
    required IField<DateTime> doAtField,
  })  : _titleField = titleField,
        _descriptionField = descriptionField,
        _valueField = valueField,
        _isRecurringField = isRecurringField,
        _isBillingField = isBillingField,
        _doAtField = doAtField;

  @override
  void init() {
    if (updateTodo != null) {
      _titleField.controller?.text = updateTodo!.title;
      _descriptionField.controller?.text = updateTodo!.description;
      _valueField.controller?.text = updateTodo!.value?.toString() ?? '';
      _isRecurringField.valueNotifier.value = updateTodo!.recurring;
      _isBillingField.valueNotifier.value = updateTodo!.pay;
      _doAtField.valueNotifier.value = updateTodo!.doAt;
    }
  }

  @override
  void dispose() {
    _titleField.dispose();
    _descriptionField.dispose();
    _valueField.dispose();
    _isRecurringField.dispose();
    _isBillingField.dispose();
    _doAtField.dispose();
  }

  @override
  Future<bool> createTodo() async {
    try {
      loading.isLoading = true;
      if (validateFields()) {
        await createTodoUsecase(
          title: _titleField.valueNotifier.value!,
          description: _descriptionField.valueNotifier.value,
          value: _valueField.valueNotifier.value,
          isRecurring: _isRecurringField.valueNotifier.value!,
          isBilling: _isBillingField.valueNotifier.value!,
          doAt: _doAtField.valueNotifier.value!,
        );

        return true;
      }

      return false;
    } finally {
      loading.isLoading = false;
    }
  }

  bool validateFields() {
    _titleField.validate();
    _descriptionField.validate();
    _valueField.validate();
    _isRecurringField.validate();
    _isBillingField.validate();
    _doAtField.validate();

    return !_titleField.hasError &&
        !_valueField.hasError &&
        !_doAtField.hasError &&
        !_isRecurringField.hasError &&
        !_isBillingField.hasError;
  }
}
