import 'package:amarthacodingtestflutterfaturrahman/blocs/todo_cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<GetIt> init() async {
  /// Khusus Bloc / Cubit
  if (!sl.isRegistered<TodoCubit>()) {
    sl.registerLazySingleton(() => TodoCubit());
  }


  /// Khusus Repository


  /// Khusus Data sources


  /// Khusus Core

  if (!sl.isRegistered<GlobalKey<NavigatorState>>()) {
    sl.registerLazySingleton(() => GlobalKey<NavigatorState>());
  }



  ///Khusus Create DB

  return sl;
}
