import 'package:demo_version/pages/Tasks/description_request_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_text_field.dart';

class CreateRequestPage extends StatelessWidget {
  const CreateRequestPage({Key? key}) : super(key: key);

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
              MyTextField(
                hintText: "Введите адрес",
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
                              status: "В процессе",
                              address: "Проспект Манаса 35/2",
                              problemDesc: "Отключение света/воды",
                              statusColor: Colors.grey,
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
}
