import 'package:flutter/material.dart';

class ProblemModel {
  final String problem;
  final String status;
  final Color color;
  final int position;
  final String nameSurname;
  final int phoneNumber;

  ProblemModel({
    required this.problem,
    required this.status,
    required this.color,
    required this.position,
    required this.nameSurname,
    required this.phoneNumber,
  });
}

List<ProblemModel> allProblems = [
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem: "Прорыв трубы",
      color: Colors.red,
      position: 2,
      status: 'Открытый'),
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem: "Неправильный счет за услуги",
      color: Colors.amber,
      position: 1,
      status: "В работе"),
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem: "Высокий температурный показатель воды.",
      color: Colors.grey,
      position: 2,
      status: "Завершенный"),
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem: "Высокий температурный показатель воды.",
      color: Colors.red,
      position: 2,
      status: "В работе"),
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem: " Абразивный эффект при использовании воды",
      color: Colors.green,
      position: 0,
      status: "Открытый"),
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem: "Вода пенится. Запах септика.",
      color: Colors.grey,
      position: 1,
      status: "Завершенный"),
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem:
          "Вода из крана холодной воды поступает прозрачная, но со временем, особенно при нагревании, приобретает бурую окраску. Белье при стирке приобретает желтоватый оттенок. Потемнение кофе, чая и других напитков.  ",
      color: Colors.grey,
      position: 0,
      status: "Завершенный"),
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem: "Сгорел мотор",
      color: Colors.grey,
      position: 0,
      status: "Завершенный"),
  ProblemModel(
      nameSurname: "Азамат Азаматов",
      phoneNumber: 996787878,
      problem: "Не работает счетчик",
      color: Colors.grey,
      position: 0,
      status: "Завершенный"),
];

final List<String> allStatuses = [
  "Завершенный",
  "Открытый",
  "В работе",
];
