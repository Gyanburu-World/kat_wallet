import 'package:project_quest/core/base/abstractions/field.interface.dart';

import '../../shared/loading/loading.interface.dart';
import '../binding/todo_controller.interface.dart';

class TodoController implements ITodoController {
  final ILoadingController loading;

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
  IField<double> get value => throw _valueField;

  TodoController({
    required this.loading,
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
    // TODO: Carregar os dados do todo clicado
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
  Future<void> createTodo() {
    // TODO: implement authenticateUser
    throw UnimplementedError();
  }
}
