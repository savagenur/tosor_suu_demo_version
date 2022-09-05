import 'package:demo_version/models/address_model.dart';
import 'package:demo_version/pages/Tasks/description_request_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_text_field.dart';
import 'detail_client_info.dart';

class CreateRequestPage2 extends StatefulWidget {
  final AddressModel addressModel;
  const CreateRequestPage2({Key? key, required this.addressModel})
      : super(key: key);

  @override
  State<CreateRequestPage2> createState() => _CreateRequestPage2State();
}

class _CreateRequestPage2State extends State<CreateRequestPage2> {
  late String status;
  @override
  void initState() {
    // TODO: implement initState
    status = widget.addressModel.priority!;

    super.initState();
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextItem(
                  title: "ФИО: ",
                  fontSize: 22,
                  text: widget.addressModel.nameSurname),
              TextItem(
                  title: "Номер телефона: ",
                  fontSize: 22,
                  text: '+' + widget.addressModel.phoneNumber.toString()),
              TextItem(
                  title: "Лицевой счет: ",
                  fontSize: 22,
                  text: widget.addressModel.personalAccount.toString()),
              TextItem(
                  title: "Адрес: ",
                  fontSize: 22,
                  text: widget.addressModel.title),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  TextItem(title: "Приоритет: ", fontSize: 22, text: status),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Опишите проблему",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Комментарий",
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
        currentIndex: 1,
      ),
    );
  }

  String selectedValue = statuses.first;
  static const List<String> statuses = [
    "Нормалный",
    "Высокий",
    "Чрезвычайный",
  ];
  buildPopupMenuItem() {
    return statuses.map((value) {
      return PopupMenuItem(
        child: RadioListTile(
          value: value,
          groupValue: selectedValue,
          title: Text(value),
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
              status = selectedValue;
            });
            Navigator.pop(context);
          },
        ),
      );
    }).toList();
  }
}
