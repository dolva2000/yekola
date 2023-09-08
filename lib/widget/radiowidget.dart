import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yekola/provider/radioProvider.dart';

class RadioWidegt extends ConsumerWidget {
  const RadioWidegt({
    super.key,
    required this.title,
    required this.valueInput,
    required this.cateColor,
    required this.onChangeValue,
  });
  final String title;
  final int valueInput;
  final Color cateColor;
  final VoidCallback onChangeValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioCategory = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: cateColor),
        child: RadioListTile(
            activeColor: cateColor,
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
              offset: Offset(-22, 0),
              child: Text(title),
            ),
            value: valueInput,
            groupValue: radioCategory,
            onChanged: (value) => onChangeValue()),
      ),
    );
  }
}
