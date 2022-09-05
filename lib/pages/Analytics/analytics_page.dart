import 'package:demo_version/pages/Analytics/my_analytics_page.dart';
import 'package:demo_version/pages/home_page.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('ОО "Тосор Суу"'),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: "Общая сводка",),
            Tab(text: "Моя сводка",),
          ]),
        ),
        body: TabBarView(children: [
          GeneralAnalytics(screenSize: screenSize),
        MyAnalyticsPage()
        ]),
        bottomNavigationBar: RoutesWidget(
          currentIndex: 0,
        ),
      ),
    );
  }
}

class GeneralAnalytics extends StatelessWidget {
  const GeneralAnalytics({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Общая сводка",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          
          GraphicWidget(
            screenSize: screenSize,
            number: "2 333 100 / 3 433 311",
            title: "Собранно за всё время",
          ),
          GraphicWidget(
            screenSize: screenSize,
            number: "333 100 / 433 311",
            title: "Собранно за август",
          ),
        ],
      ),
    ),
        );
  }
}

class GraphicWidget extends StatelessWidget {
  final String title;
  final String number;

  const GraphicWidget({
    Key? key,
    required this.screenSize,
    required this.title,
    required this.number,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenSize.width * .55,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.black)),
            ),
            Container(
              width: screenSize.width * .25,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          number,
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
