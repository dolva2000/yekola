import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:yekola/const/style.dart';
import 'package:yekola/provider/radioProvider.dart';
import 'package:yekola/widget/dateTimeWidget.dart';
import 'package:yekola/widget/radiowidget.dart';
import 'package:yekola/widget/textfieldwidget.dart';

class AddNewTask extends ConsumerWidget {
  const AddNewTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
          ),
          Gap(33),
          Text('Descrition', style: Appstyle.headingStyle),
          Gap(6),
          TextfielWidget(
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
                    onChangeValue: () =>
                        ref.read(radioProvider.notifier).update((state) => 1)),
              ),
              Expanded(
                child: RadioWidegt(
                    title: 'General',
                    cateColor: Colors.blue,
                    valueInput: 2,
                    onChangeValue: () =>
                        ref.read(radioProvider.notifier).update((state) => 2)),
              ),
              Expanded(
                child: RadioWidegt(
                    title: 'General',
                    cateColor: Colors.amberAccent,
                    valueInput: 3,
                    onChangeValue: () =>
                        ref.read(radioProvider.notifier).update((state) => 3)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                  title: 'Date', value: 'dd/mm/yy', icon: Icons.calendar_month),
              DateTimeWidget(
                  title: 'Heure',
                  value: 'HH:SS',
                  icon: Icons.time_to_leave_outlined)
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
                onPressed: () {},
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
                onPressed: () {},
                child: Text(
                  'Annuler',
                  style: TextStyle(color: Colors.blue),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
