import 'package:flutter/material.dart';

class TodoModel {
  final String title;
  final String? descritpion;
  final Color? color;
  final int timeInSec;

  TodoModel(this.title, this.descritpion, this.color, this.timeInSec);

  get getTitle => title;

  get getDescritpion => descritpion;

  get getColor => color;

  get getTimeInSec => timeInSec;
}
