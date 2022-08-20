import 'package:demo_version/pages/analytics_page.dart';
import 'package:demo_version/pages/Clients/search_client_page.dart';
import 'package:demo_version/pages/Tasks/send_request_page.dart';
import 'package:flutter/material.dart';

import '../widgets/my_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidget(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SendRequestPage()));
              },
              color: Colors.grey[100],
              title:
                  "Оставить заявку тех. службе (Оставить заявку на рассмотрение)",
            ),
            SizedBox(
              height: 30,
            ),
            MyWidget(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AnalyticsPage()));
                },
                color: Colors.grey[100],
                title: "Просмотр сводки (Посмотреть аналитику)"),
            SizedBox(
              height: 30,
            ),
            MyWidget(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchClientPage()));
                },
                color: Colors.grey[100],
                title: "Информация об абоненте"),
          ],
        ),
      ),
    );
  }
}
