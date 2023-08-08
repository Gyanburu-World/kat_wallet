import 'package:flutter/foundation.dart';
import 'package:project_quest/features/todo/usecases/edit_todo.usecas.dart';

import '../../../core/base/abstractions/field.interface.dart';
import '../../../core/domains/todo/domain/models/todo.model.dart';
import '../../shared/loading/loading.interface.dart';
import '../binding/todo_controller.interface.dart';
import '../usecases/create_todo.usecase.dart';
import '../usecases/delete_todo.usecase.dart';

class TodoController implements ITodoController {
  final ILoadingController loading;
  final CreateTodoUsecase createTodoUsecase;
  final EditTodoUsecase editTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;

  final IField<String> _titleField;
  final IField<String> _descriptionField;
  final IField<double> _valueField;
  final IField<bool> _isRecurringField;
  final IField<bool> _isBillingField;
  final IField<DateTime> _doAtField;

  late final ValueNotifier<bool> _isToEdit;

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

  TodoModel? todoForUpdate;

  @override
  ValueNotifier<bool> get isToEdit => _isToEdit;

  TodoController({
    required this.loading,
    required this.createTodoUsecase,
    required this.todoForUpdate,
    required this.editTodoUsecase,
    required this.deleteTodoUsecase,
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
        _doAtField = doAtField {
    _isToEdit = ValueNotifier(false);
  }

  @override
  void init() {
    if (todoForUpdate != null) {
      _isToEdit.value = true;
      _titleField.controller?.text = todoForUpdate!.title;
      _descriptionField.controller?.text = todoForUpdate!.description ?? '';
      _valueField.controller?.text = todoForUpdate!.value?.toString() ?? '';
      _isRecurringField.valueNotifier.value = todoForUpdate!.isRecurring;
      _isBillingField.valueNotifier.value = todoForUpdate!.isBilling;
      _doAtField.valueNotifier.value = todoForUpdate!.doAt;
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

  @override
  Future<bool> editTodo() async {
    try {
      loading.isLoading = true;
      if (validateFields()) {
        await editTodoUsecase(
          id: todoForUpdate!.id,
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

  @override
  Future<void> deleteTodo() async {
    if (todoForUpdate != null) await deleteTodoUsecase(todoForUpdate!);
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
