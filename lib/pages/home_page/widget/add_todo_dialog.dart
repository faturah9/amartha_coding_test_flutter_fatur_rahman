import 'package:amarthacodingtestflutterfaturrahman/datas/models/todo_model.dart';
import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({Key? key}) : super(key: key);

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _formKey = GlobalKey<FormState>();

  String? _description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.close),
              ),
            ),
          ),
          const Text(
            "Add a new Todo item!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      onSaved: (value) => _description = value!,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.of(context).pop(
                              TodoModel(
                                description: _description,
                                isCompleted: false,
                              ),
                            );
                          }
                        },
                        child: const Text('Add'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
