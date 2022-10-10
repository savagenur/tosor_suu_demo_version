import 'package:demo_version/widgets/my_text_field.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_button.dart';

class AddNewClientPage extends StatefulWidget {
  AddNewClientPage({Key? key}) : super(key: key);

  @override
  State<AddNewClientPage> createState() => _AddNewClientPageState();
}

class _AddNewClientPageState extends State<AddNewClientPage> {
  List<String> items = [
    '№_',
    '№1',
    '№2',
    '№3',
    '№4',
    '№5',
    '№6',
    '№7',
  ];
  bool isSwitchOn = true;
  String? selectedItem = '№_';

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
              Text(
                "Лицевой счет: 3245145187341",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10,),
              Column(
                        children: [
                          Chip(
                            backgroundColor:isSwitchOn? Colors.green[300]:Colors.grey,
                            label: Text(isSwitchOn? "Есть счётчик":"Нет счётчика",style: TextStyle(color: Colors.white),)),
                          Switch(
                          value: isSwitchOn,
                          onChanged: (value) {
                            setState(() {
                              isSwitchOn = value;
                            });
                          })
                        ],
                      ),
              Container(
                height: MediaQuery.of(context).size.height * .62,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                          hintText: "ФИО абонента / на кого оформлен дом"),
                      MyTextField(hintText: "Город, Район"),
                      MyTextField(hintText: "Адрес"),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          value: selectedItem,
                          items: items
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text('Участок ' + item),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {}),
                      SizedBox(
                        height: 20,
                      ),
                      
                     isSwitchOn? MyTextField(hintText: "Последние показания счетчика"):Container(),
                      MyTextField(hintText: "Номер телефона"),
                    ],
                  ),
                ),
              ),
              MyButton(
                title: 'Сохранить',
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
