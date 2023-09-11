import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yekola/services/todo_service.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});
