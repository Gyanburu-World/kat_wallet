class TodoModel {
  final int id;
  final String title;
  final String? description;
  final double? value;
  final bool isRecurring;
  final DateTime doAt;
  final DateTime? doneAt;
  final bool isBilling;

  const TodoModel({
    required this.id,
    required this.title,
    required this.value,
    required this.description,
    required this.doAt,
    this.doneAt,
    required this.isRecurring,
    required this.isBilling,
  });
}
