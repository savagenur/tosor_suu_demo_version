import 'package:demo_version/pages/Tasks/description_request_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_text_field.dart';
import '../Clients/detail_client_info.dart';

class CreateRequestPage extends StatefulWidget {
  CreateRequestPage({Key? key}) : super(key: key);

  @override
  State<CreateRequestPage> createState() => _CreateRequestPageState();

  static const List<String> statuses = [
    "Завершенный",
    "Открытый",
    "В работе",
  ];
}

class _CreateRequestPageState extends State<CreateRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ОО "Тосор Суу"'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  TextItem(
                      title: "Приоритет: ", fontSize: 18, text: selectedValue),
                  PopupMenuButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                      itemBuilder: (context) {
                        return buildPopupMenuItem();
                      })
                ],
              ),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                hintText: "Введите ФИО",
              ),
              MyTextField(
                hintText: "Введите адрес",
              ),
              MyTextField(
                hintText: "Контактный номер",
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Опишите проблему",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      title: "Отмена",
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      backgrondColor: Colors.red),
                  MyButton(
                      title: "Сохранить",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DescriptionRequestPage(
                              nameSurname: "Азамат Азаматов",
                              phoneNumber: 996787878,
                              status: "Открытый",
                              address: "Проспект Манаса 35/2",
                              problemDesc: "Отключение света/воды",
                              statusColor: selectedValue == priorities[0]
                                  ? Colors.green
                                  : selectedValue == priorities[1]
                                      ? Colors.amber
                                      : Colors.red,
                            ),
                          ),
                        );
                      },
                      backgrondColor: Colors.green),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RoutesWidget(
        currentIndex: 2,
      ),
    );
  }

  static const List<String> priorities = [
    "Нормалный",
    "Высокий",
    "Чрезвычайный",
  ];
  String selectedValue = priorities.first;

  buildPopupMenuItem() {
    return priorities.map((value) {
      return PopupMenuItem(
        child: RadioListTile(
          value: value,
          groupValue: selectedValue,
          title: Text(value),
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
            Navigator.pop(context);
          },
        ),
      );
    }).toList();
  }
}
