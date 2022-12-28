import 'package:amarthacodingtestflutterfaturrahman/blocs/todo_cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as get_it;

List<BlocProvider> get getProviders => [
  BlocProvider<TodoCubit>(
    create: (context) => get_it.sl<TodoCubit>(),
  ),

];
