class TodoModel {
  final int id;
  final String title;
  final String description;
  final double? value;
  final bool recurring;
  final DateTime doAt;
  final DateTime? doneAt;
  final bool pay;

  const TodoModel({
    required this.id,
    required this.title,
    required this.value,
    required this.description,
    required this.doAt,
    required this.doneAt,
    required this.recurring,
    required this.pay,
  });
}
