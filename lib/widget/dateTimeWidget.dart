import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:yekola/const/style.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.ontap,
  });
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => ontap(),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Appstyle.headingStyle,
            ),
            Gap(6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [Icon(icon), Gap(12), Text(value)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
