part of 'task_filter_cubit.dart';

class TaskFilterState extends Equatable {
  final Filtred filtred;
  const TaskFilterState({required this.filtred});

  factory TaskFilterState.initial() {
    return const TaskFilterState(filtred: Filtred.all);
  }

  @override
  List<Object> get props => [filtred];

  @override
  String toString() {
    return "TaskFilterState is : ($filtred)";
  }

  TaskFilterState copyWith({Filtred? filtred}) {
    return TaskFilterState(
      filtred: this.filtred,
    );
  }
}
