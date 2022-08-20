import 'package:demo_version/pages/Tasks/create_request_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

class DescriptionRequestPage extends StatelessWidget {
  final String status;
  final Color statusColor;
  final String address;
  final String problemDesc;

  const DescriptionRequestPage(
      {Key? key,
      required this.status,
      required this.address,
      required this.problemDesc,
      required this.statusColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Описание заявки"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleAndDescWidget(
                title: "Статус",
                isStatus: true,
                text: status,
                color: statusColor,
              ),
              TitleAndDescWidget(
                title: "Адрес",
                text: address,
              ),
              TitleAndDescWidget(
                title: "Описание проблемы",
                text: problemDesc,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      title: "Редактировать",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CreateRequestPage(),
                          ),
                        );
                      },
                      backgrondColor: Colors.grey),
                  MyButton(
                      title: "Удалить заявку",
                      onTap: () {},
                      backgrondColor: Colors.red),
                ],
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

class TitleAndDescWidget extends StatelessWidget {
  final String title;
  final String text;
  final Color? color;
  final bool isStatus;
  const TitleAndDescWidget({
    Key? key,
    required this.title,
    required this.text,
    this.color = Colors.white,
    this.isStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
          color: color,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: isStatus ? Colors.white : Colors.black),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
