import 'package:demo_version/models/problem_model.dart';
import 'package:demo_version/pages/Tasks/create_request_page.dart';
import 'package:demo_version/pages/Tasks/description_request_page.dart';
import 'package:demo_version/pages/home_page.dart';
import 'package:demo_version/widgets/my_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_button.dart';
import '../../widgets/routes_widget.dart';

class SendRequestPage extends StatelessWidget {
  const SendRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProblemModel> problems = [
      ProblemModel(
          problem: "Прорыв трубы",
          color: Colors.red,
          position: 2,
          status: "В очереди"),
      ProblemModel(
          problem: "Не работает счетчик",
          color: Colors.green,
          position: 0,
          status: "Выполнено"),
      ProblemModel(
          problem: "Неправильный счет за услуги",
          color: Colors.amber,
          position: 1,
          status: "В процессе"),
      ProblemModel(
          problem: "Сгорел мотор",
          color: Colors.green,
          position: 0,
          status: "Выполнено"),
      ProblemModel(
          problem: "Высокий температурный показатель воды.",
          color: Colors.red,
          position: 2,
          status: "В очереди"),
      ProblemModel(
          problem: " Абразивный эффект при использовании воды",
          color: Colors.green,
          position: 0,
          status: "Выполнено"),
      ProblemModel(
          problem: "Вода пенится. Запах септика.",
          color: Colors.amber,
          position: 1,
          status: "В процессе"),
      ProblemModel(
          problem:
              "Вода из крана холодной воды поступает прозрачная, но со временем, особенно при нагревании, приобретает бурую окраску. Белье при стирке приобретает желтоватый оттенок. Потемнение кофе, чая и других напитков.  ",
          color: Colors.green,
          position: 0,
          status: "Выполнено"),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('ОО "Тосор Суу"'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Выберите тип проблемы:',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * .6,
                child: ListView.builder(
                  itemCount: problems.length,
                  itemBuilder: (BuildContext context, int index) {
                    problems.sort(
                      ((a, b) => a.position.compareTo(b.position))
                    );
                    return MyButton(
                        width: MediaQuery.of(context).size.width,
                        title: problems[index].problem,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DescriptionRequestPage(
                                status: problems[index].status,
                                address: "Проспект Манаса 35/2",
                                problemDesc: problems[index].problem,
                                statusColor: problems[index].color,
                              ),
                            ),
                          );
                        },
                        backgrondColor: problems[index].color);
                  },
                ),
              ),
              MyButton(
                title: 'Создание заявки',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateRequestPage()));
                },
                backgrondColor: Colors.blue,
                fontSize: 30,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: RoutesWidget(
        currentIndex: 2,
      ),
    );
  }
}
