class TodoModel {
  final int id;
  final String title;
  final double? value;
  final DateTime date;
  final bool isBilling;

  TodoModel({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
    required this.isBilling,
  });
}
