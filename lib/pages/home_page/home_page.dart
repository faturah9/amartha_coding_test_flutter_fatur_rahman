import 'dart:math';

import 'package:amarthacodingtestflutterfaturrahman/datas/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/todo_cubit/todo_cubit.dart';
import '../../injection_container.dart';
import 'widget/add_todo_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final todoCubit = sl<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Amartha Coding Test Flutter Fatur"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<TodoCubit, TodoState>(
          bloc: todoCubit,
          builder: (context, state) {
            if (state.todoModel == null) {
              return noData();
            } else if (state.todoModel!.isEmpty) {
              return noData();
            } else {
              return ListView.builder(
                itemCount: state.todoModel!.length,
                itemBuilder: (context, index) {
                  final todos = state.todoModel![index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(Random().nextInt(0xffffffff)),
                      child: Text(
                        todos.description!.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    title: todos.isCompleted == true
                        ? Text(
                            todos.description!,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 24,
                            ),
                          )
                        : Text(
                            todos.description!,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                    onTap: () {
                      todoCubit.toggleTodo(
                        todos,
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showAddTodoDialog(context),
      ),
    );
  }

  showAddTodoDialog(BuildContext context) async {
    final todo = await showDialog<TodoModel>(
      context: context,
      builder: (context) {
        return const AddTodoDialog();
      },
    );
    if (todo != null) {
      sl<TodoCubit>().addTodo(todo);
    }
  }

  Widget noData() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'res/graphics/List.svg',
            width: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Tidak ada data',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
