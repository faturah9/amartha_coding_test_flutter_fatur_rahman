import 'package:amarthacodingtestflutterfaturrahman/datas/models/todo_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState());

  void addTodo(TodoModel todo) {
    final todoList = state.todoModel ?? [];
    todoList.add(todo);
    emit(state.copyWith(
      todoModel: todoList,
    ));
  }

  void toggleTodo(TodoModel todo) {
    if (kDebugMode) {
      print(todo.description);
    }
    final todoList = state.todoModel ?? [];
    emit(
      state.copyWith(
        todoModel: todoList.map((e) {
          if (e.description == todo.description) {
            return e.copyWith(isCompleted: !e.isCompleted!);
          } else {
            return e;
          }
        }).toList(),
      ),
    );
  }
}
