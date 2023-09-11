import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:yekola/const/style.dart';
import 'package:yekola/models/todo_app.dart';
import 'package:yekola/provider/dateTimeProvider.dart';
import 'package:yekola/provider/radioProvider.dart';
import 'package:yekola/provider/services_provider.dart';
import 'package:yekola/widget/dateTimeWidget.dart';
import 'package:yekola/widget/radiowidget.dart';
import 'package:yekola/widget/textfieldwidget.dart';

class AddNewTask extends ConsumerWidget {
  const AddNewTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final dateProvi = ref.watch(dateProvider);
    final timeProvi = ref.watch(timeProvider);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height * 0.70,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'AJOUTER NOUVEAU',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            Divider(thickness: 1.2, color: Colors.grey.shade200),
            Gap(12),
            Text('Titre', style: Appstyle.headingStyle),
            Gap(6),
            TextfielWidget(
              maxLine: 1,
              hintText: 'Ajouter le titre de votre note',
              txtController: titleController,
            ),
            Gap(33),
            Text('Descrition', style: Appstyle.headingStyle),
            Gap(6),
            TextfielWidget(
              txtController: descriptionController,
              maxLine: 6,
              hintText: 'Ajouter la descrition',
            ),
            Row(
              children: [
                Expanded(
                  child: RadioWidegt(
                      title: 'LRN',
                      cateColor: Colors.green,
                      valueInput: 1,
                      onChangeValue: () => ref
                          .read(radioProvider.notifier)
                          .update((state) => 1)),
                ),
                Expanded(
                  child: RadioWidegt(
                      title: 'General',
                      cateColor: Colors.blue,
                      valueInput: 2,
                      onChangeValue: () => ref
                          .read(radioProvider.notifier)
                          .update((state) => 2)),
                ),
                Expanded(
                  child: RadioWidegt(
                      title: 'General',
                      cateColor: Colors.amberAccent,
                      valueInput: 3,
                      onChangeValue: () => ref
                          .read(radioProvider.notifier)
                          .update((state) => 3)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                    title: 'Date',
                    value: dateProvi,
                    icon: Icons.calendar_month,
                    ontap: () async {
                      final getvalue = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025));
                      if (getvalue != null) {
                        final format = DateFormat.yMd();
                        ref
                            .read(dateProvider.notifier)
                            .update((state) => format.format(getvalue));
                      }
                    }),
                DateTimeWidget(
                  title: 'Heure',
                  value: timeProvi,
                  icon: Icons.time_to_leave_outlined,
                  ontap: () async {
                    final getTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (getTime != null) {
                      ref
                          .read(timeProvider.notifier)
                          .update((state) => getTime.format(context));
                    }
                  },
                )
              ],
            ),
            Gap(17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Color(0xFFD5E8FA),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    final getRadio = ref.read(radioProvider);
                    String category = '';
                    if (getRadio == 1) {
                      category = 'learnig';
                    } else if (getRadio == 2) {
                      category = 'general';
                    } else {
                      category = 'element';
                    }
                    ref.read(serviceProvider).addNeswTask(TodoModel(
                        titleTask: titleController.text,
                        descTask: descriptionController.text,
                        category: category,
                        timeTsak: ref.read(timeProvider),
                        dateTsak: ref.read(dateProvider)));
                    print('saving');
                  },
                  child: Text('Confirmer'),
                )),
                Gap(17),
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      elevation: 0,
                      side: BorderSide(color: Colors.blue.shade800),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Annuler',
                    style: TextStyle(color: Colors.blue),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
