import 'package:demo_version/models/problem_model.dart';
import 'package:demo_version/pages/Tasks/description_request_page.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_button.dart';

class CompletedTasksPage extends StatelessWidget {
  const CompletedTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProblemModel> solvedProblems = [
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
      ProblemModel(
          nameSurname: "Азамат Азаматов",
          phoneNumber: 996787878,
          problem: "Высокий температурный показатель воды.",
          color: Colors.grey,
          position: 2,
          status: "Завершенный"),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Выполненные заявки"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: solvedProblems.length,
            itemBuilder: (BuildContext context, int index) {
              solvedProblems.sort(((a, b) => a.position.compareTo(b.position)));
              return MyButton(
                  isTaskButton: true,
                  width: MediaQuery.of(context).size.width,
                  title: solvedProblems[index].problem,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DescriptionRequestPage(
                          nameSurname: solvedProblems[index].nameSurname,
                          phoneNumber: solvedProblems[index].phoneNumber,
                          isSolved: true,
                          status: solvedProblems[index].status,
                          address: "Проспект Манаса 35/2",
                          problemDesc: solvedProblems[index].problem,
                          statusColor: solvedProblems[index].color,
                        ),
                      ),
                    );
                  },
                  backgrondColor: solvedProblems[index].color);
            },
          ),
        ),
        bottomNavigationBar: RoutesWidget(
          currentIndex: 2,
        ));
  }
}
