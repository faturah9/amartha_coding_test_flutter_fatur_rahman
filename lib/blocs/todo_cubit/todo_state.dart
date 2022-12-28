part of 'todo_cubit.dart';

@immutable
class TodoState {
  final List<TodoModel>? todoModel;

  const TodoState({
    this.todoModel,
  });


  TodoState copyWith({
    List<TodoModel>? todoModel,
  }) {
    return TodoState(
      todoModel: todoModel ?? this.todoModel,
    );
  }
}
