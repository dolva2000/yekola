import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:yekola/provider/services_provider.dart';

class CardTodoWidget extends ConsumerWidget {
  const CardTodoWidget({
    super.key,
    required this.getIndex,
  });
  final int getIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(
        data: (data) => Center(
              child: Text('data'),
            ),
        error: (error, StackTrace) => Center(
              child: Text('error'),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
