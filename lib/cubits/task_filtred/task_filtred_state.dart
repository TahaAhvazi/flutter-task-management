part of 'task_filtred_cubit.dart';

class TaskFiltredState extends Equatable {
  final List<Task> filtredTasks;
  const TaskFiltredState({required this.filtredTasks});

  factory TaskFiltredState.initial() {
    return const TaskFiltredState(
      filtredTasks: [],
    );
  }

  @override
  List<Object> get props => [filtredTasks];

  @override
  String toString() {
    return "The TodoFiltred is ($filtredTasks)";
  }

  TaskFiltredState copyWith({
    List<Task>? filtredTasks,
  }) {
    return TaskFiltredState(filtredTasks: filtredTasks ?? this.filtredTasks);
  }
}
