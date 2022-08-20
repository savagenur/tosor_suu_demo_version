import 'package:demo_version/widgets/my_text_field.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_button.dart';

class AddNewClientPage extends StatelessWidget {
  const AddNewClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавление нового абонента"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .65,
                child: Column(
                  children: [
                    MyTextField(
                        hintText: "ФИО абонента / на кого оформлен дом"),
                    MyTextField(hintText: "Адрес"),
                    MyTextField(hintText: "Последние показания счетчика"),
                    MyTextField(hintText: "Есть ли поливные участки"),
                    MyTextField(hintText: "Номер телефона"),
                  ],
                ),
              ),
              MyButton(
                title: 'Добавить абонента',
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  Navigator.of(context).pop();

                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => CreateRequestPage()));
                },
                backgrondColor: Colors.blue,
                fontSize: 30,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: RoutesWidget(
        currentIndex: 1,
      ),
    );
  }
}
