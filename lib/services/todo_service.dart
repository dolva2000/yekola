import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yekola/models/todo_app.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');
  void addNeswTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }
}
