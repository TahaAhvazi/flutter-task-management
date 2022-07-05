// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid _uuid = Uuid();

class Task extends Equatable {
  final String id;
  final String description;
  final bool completed;

  Task({
    String? id,
    required this.description,
    this.completed = false,
  }) : id = id ?? _uuid.v4();

  @override
  // TODO: implement props
  List<Object?> get props => [id, description, completed];

  @override
  String toString() {
    // TODO: implement toString
    return "Task(ID: $id DESCRIPTION: $description COMPLETED: $completed)";
  }
}
