// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  TodoModel({
    this.docID,
    this.titleTask,
    this.descTask,
    this.category,
    this.dateTsak,
    this.timeTsak,
  });

  String? docID;
  final String? titleTask;
  final String? descTask;
  final String? category;
  final String? dateTsak;
  final String? timeTsak;

  TodoModel copyWith({
    String? titleTask,
    String? descTask,
    String? category,
    String? dateTsak,
    String? timeTsak,
  }) {
    return TodoModel(
      titleTask: titleTask ?? this.titleTask,
      descTask: descTask ?? this.descTask,
      category: category ?? this.category,
      dateTsak: dateTsak ?? this.dateTsak,
      timeTsak: timeTsak ?? this.timeTsak,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titleTask': titleTask,
      'descTask': descTask,
      'category': category,
      'dateTsak': dateTsak,
      'timeTsak': timeTsak,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      titleTask: map['titleTask'] != null ? map['titleTask'] as String : null,
      descTask: map['descTask'] != null ? map['descTask'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      dateTsak: map['dateTsak'] != null ? map['dateTsak'] as String : null,
      timeTsak: map['timeTsak'] != null ? map['timeTsak'] as String : null,
    );
  }

  factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModel(
        docID: doc.id,
        titleTask: doc['titleTask'],
        descTask: doc['descTask'],
        category: doc['category'],
        dateTsak: doc['dateTsak'],
        timeTsak: doc['timeTsak']);
  }
}
