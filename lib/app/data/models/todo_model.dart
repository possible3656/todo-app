import 'dart:convert';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String roomModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  final String title;
  final String? descritpion;
  final Color? color;
  int timeInSec;
  int timeInMin;
  int status;
  bool paused = true;

  final CustomTimerController timerController = CustomTimerController();

  TodoModel(
    this.title,
    this.timeInMin,
    this.timeInSec,
    this.status, {
    this.descritpion,
    this.color,
  });

  get getTitle => title;
  get getDescritpion => descritpion;
  get getColor => color;
  get getTimeInMin => timeInMin;
  get getTimeInSec => timeInSec;
  get getTimerController => timerController;
  get getStatus => status;
  get getPaused => paused;

  set setPaused(paused) => this.paused = paused;
  set setStatus(int status) => this.status = status;

  Map<String, dynamic> toJson() => {
        'title': title,
        'descritpion': descritpion,
        'timeInMin': timeInMin,
        'timeInSec': timeInSec,
        'color': color,
        'status': status,
      };

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        json['title'],
        json['timeInMin'],
        json['timeInSec'],
        json['status'] ?? 0,
        descritpion: json['descritpion'],
        color: json['color'],
      );
}
