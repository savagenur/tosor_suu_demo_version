import 'package:demo_version/models/problem_model.dart';
import 'package:demo_version/pages/Tasks/completed_tasks_page.dart';
import 'package:demo_version/pages/Tasks/create_request_page.dart';
import 'package:demo_version/pages/Tasks/description_request_page.dart';
import 'package:demo_version/pages/home_page.dart';
import 'package:demo_version/widgets/my_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_button.dart';
import '../../widgets/routes_widget.dart';

class SendRequestPage extends StatefulWidget {
  const SendRequestPage({Key? key}) : super(key: key);

  @override
  State<SendRequestPage> createState() => _SendRequestPageState();
}

class _SendRequestPageState extends State<SendRequestPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<ProblemModel> problems;
  @override
  void initState() {
    problems = List.of(allProblems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('ОО "Тосор Суу"'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: Icon(
            Icons.info,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CompletedTasksPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Завершенные\nзаявки",
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder?>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                      30,
                    )))),
                  )
                ],
              ),
            ),
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
              padding: EdgeInsets.all(5),
              child: buildExpansionTile(
                  context: context, title: "Открытые", status: "Открытый"),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: buildExpansionTile(
                  context: context, title: "В работе", status: "В работе"),
            ),
            // Container(
            //   padding: EdgeInsets.all(5),
            //   child: buildExpansionTile(
            //       context: context, title: "Завершенные", status: "Завершенный"),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            )
          ],
        ),
      ),
      bottomNavigationBar: RoutesWidget(
        currentIndex: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateRequestPage()));
          },
          icon: Icon(Icons.add),
          label: Text('Создание заявки')),
    );
  }

  ExpansionTile buildExpansionTile({
    required BuildContext context,
    required String title,
    required String status,
  }) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.grey[300],
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
      expandedAlignment: Alignment.centerLeft,
      children: List.generate(problems.length, (index) {
        if (problems[index].status == status) {
          return MyButton(
              isTaskButton: true,
              width: MediaQuery.of(context).size.width,
              title: problems[index].problem,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DescriptionRequestPage(
                      nameSurname: problems[index].nameSurname,
                      phoneNumber: problems[index].phoneNumber,
                      status: problems[index].status,
                      address: "Проспект Манаса 35/2",
                      problemDesc: problems[index].problem,
                      statusColor: problems[index].color,
                    ),
                  ),
                );
              },
              backgrondColor: problems[index].color);
        } else {
          return Container();
        }
      }),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Информация\nо приоритетах:",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            PriorityWidget(
              title: "Нормалный",
              color: Colors.green,
            ),
            PriorityWidget(
              title: "Высокий",
              color: Colors.amber,
            ),
            PriorityWidget(
              title: "Чрезвычайный",
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class PriorityWidget extends StatelessWidget {
  final String title;
  final Color color;
  const PriorityWidget({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.square,
            size: 30,
            color: color,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Divider(),
      ],
    );
  }
}
