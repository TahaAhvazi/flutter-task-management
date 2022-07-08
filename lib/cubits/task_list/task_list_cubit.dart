import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/models/task.dart';

part 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit() : super(TaskListState.initial());

  void addTask(String description) {
    final newTask = Task(description: description);
    final newTasks = [...state.task, newTask];
    emit(
      state.copyWith(task: newTasks),
    );
  }

  void editTask(String id, String description) {
    final newTask = state.task.map((Task task) {
      if (id == id) {
        Task(
          id: id,
          description: description,
          completed: task.completed,
        );
      }
      return task;
    }).toList();

    emit(
      state.copyWith(task: newTask),
    );
  }

  void toggleTask(String id) {
    final newTask = state.task.map((Task task) {
      if (id == id) {
        Task(
          id: id,
          description: task.description,
          completed: !task.completed,
        );
      }
      return task;
    }).toList();
    emit(state.copyWith(task: newTask));
  }

  void removeTask(String id) {
    final newTasks = state.task.where((Task task) => task.id != id).toList();
    emit(
      state.copyWith(task: newTasks),
    );
  }
}
