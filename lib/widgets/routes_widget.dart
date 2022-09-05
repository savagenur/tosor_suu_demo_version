import 'package:demo_version/pages/Analytics/analytics_page.dart';
import 'package:demo_version/pages/Clients/search_client_page.dart';
import 'package:demo_version/pages/Tasks/send_request_page.dart';
import 'package:demo_version/widgets/my_widget.dart';
import 'package:flutter/material.dart';

class RoutesWidget extends StatefulWidget {
  int currentIndex;
  RoutesWidget({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<RoutesWidget> createState() => _RoutesWidgetState();
}

class _RoutesWidgetState extends State<RoutesWidget> {
  final screens = [
    AnalyticsPage(),
    SearchClientPage(),
    SendRequestPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => setState(() {
        widget.currentIndex = index;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => screens[widget.currentIndex]));
      }),
      currentIndex: widget.currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.align_vertical_bottom_sharp), label: "Сводка"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Абоненты"),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.work_outline_outlined),
          label: "Задачи ТС",
        ),
      ],
    );
  }
}
