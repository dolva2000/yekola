import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardTodoWidget extends StatelessWidget {
  const CardTodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Container(
            width: 20,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text('DOLVA BOLOKONDI'),
                        subtitle: Text('bonjcoDHur'),
                        trailing: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              activeColor: Colors.blue,
                              shape: const CircleBorder(),
                              value: true,
                              onChanged: (value) => print(value)),
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        color: Colors.grey.shade200,
                      ),
                      Row(
                        children: [
                          Text('TODAY'),
                          Gap(12),
                          Text('12:12PM - 12:33PM')
                        ],
                      )
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20)))
        ],
      ),
    );
  }
}
