part of 'task_list_cubit.dart';

class TaskListState extends Equatable {
  final List<Task> task;

  const TaskListState({required this.task});

  factory TaskListState.initial() {
    return TaskListState(
      task: [
        Task(id: '1', description: "Clean the Room"),
        Task(id: '2', description: "Wash the dishes"),
        Task(id: '3', description: "Do homeWork"),
      ],
    );
  }

  @override
  List<Object> get props => [task];

  @override
  String toString() {
    return "Tasks list is : ($task)";
  }

  TaskListState copyWith({
    List<Task>? task,
  }) {
    return TaskListState(task: task ?? this.task);
  }
}
