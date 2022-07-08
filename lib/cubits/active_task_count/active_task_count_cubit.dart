import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/cubits/task_list/task_list_cubit.dart';
import 'package:task_management/models/task.dart';

part 'active_task_count_state.dart';

class ActiveTaskCountCubit extends Cubit<ActiveTaskCountState> {
  late final StreamSubscription taskListStreamSubscription;
  final TaskListCubit taskListCubit;
  ActiveTaskCountCubit({required this.taskListCubit})
      : super(ActiveTaskCountState.initial()) {
    taskListStreamSubscription = taskListCubit.stream.listen(
      (TaskListState taskListState) {
        // ignore: avoid_print
        print(
            "The current active Tasks number is : ${taskListState.task.length}");
        final int currentActiveTasks = taskListState.task
            .where((Task task) => !task.completed)
            .toList()
            .length;

        emit(state.copyWith(activeTaskCount: currentActiveTasks));
      },
    );
  }

  @override
  Future<void> close() {
    taskListStreamSubscription.cancel();
    return super.close();
  }
}
