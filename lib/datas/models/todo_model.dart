class TodoModel {
  final String? description;
  final bool? isCompleted;

  TodoModel({
    this.description,
    this.isCompleted,
  });

  TodoModel copyWith({
    String? description,
    bool? isCompleted,
  }) {
    return TodoModel(
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
