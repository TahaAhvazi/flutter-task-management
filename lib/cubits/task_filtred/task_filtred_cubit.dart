import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/cubits/task_filter/task_filter_cubit.dart';
import 'package:task_management/cubits/task_list/task_list_cubit.dart';
import 'package:task_management/cubits/task_search/task_search_cubit.dart';
import 'package:task_management/models/task.dart';

part 'task_filtred_state.dart';

class TaskFiltredCubit extends Cubit<TaskFiltredState> {
  late StreamSubscription taskFilterSubscription;
  late StreamSubscription taskSearchSubscription;
  late StreamSubscription taskListSubscription;

  final TaskFilterCubit taskFilterCubit;
  final TaskSearchCubit taskSearchCubit;
  final TaskListCubit taskListCubit;

  TaskFiltredCubit({
    required this.taskFilterCubit,
    required this.taskSearchCubit,
    required this.taskListCubit,
  }) : super(TaskFiltredState.initial()) {
    taskFilterSubscription =
        taskFilterCubit.stream.listen((TaskFilterState taskFilterState) {
      setFiltredTasks();
    });

    taskSearchSubscription =
        taskSearchCubit.stream.listen((TaskSearchState taskSearchState) {
      setFiltredTasks();
    });

    taskListSubscription =
        taskListCubit.stream.listen((TaskListState taskListState) {
      setFiltredTasks();
    });
  }
  void setFiltredTasks() {
    List<Task> _filtredTasks;
    switch (taskFilterCubit.state.filtred) {
      case Filtred.active:
        _filtredTasks = taskListCubit.state.task
            .where((Task task) => !task.completed)
            .toList();
        break;
      case Filtred.completed:
        _filtredTasks = taskListCubit.state.task
            .where((Task task) => task.completed)
            .toList();
        break;
      case Filtred.all:
      default:
        _filtredTasks = taskListCubit.state.task;
        break;
    }
    if (taskSearchCubit.state.searchTerm.isNotEmpty) {
      _filtredTasks = _filtredTasks
          .where((Task task) => task.description
              .toLowerCase()
              .contains(taskSearchCubit.state.searchTerm))
          .toList();
    }
    emit(
      state.copyWith(filtredTasks: _filtredTasks),
    );
  }
}
