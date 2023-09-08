import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yekola/const/style.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });
  final String title;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
