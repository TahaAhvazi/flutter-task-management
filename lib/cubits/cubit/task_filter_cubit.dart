import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/models/task.dart';

part 'task_filter_state.dart';

class TaskFilterCubit extends Cubit<TaskFilterState> {
  TaskFilterCubit() : super(TaskFilterState.initial());

  void changeFilter(Filtred newFilter) {
    emit(
      state.copyWith(filtred: newFilter),
    );
  }
}
