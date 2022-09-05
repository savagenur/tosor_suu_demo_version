import 'package:demo_version/data/dates.dart';
import 'package:demo_version/models/address_model.dart';
import 'package:demo_version/models/check_date_model.dart';
import 'package:demo_version/pages/Clients/check_of_payment_page.dart';
import 'package:demo_version/pages/Clients/debt_history.dart';
import 'package:demo_version/pages/Clients/receipt_of_payment_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:demo_version/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class CheckPage extends StatelessWidget {
  final String title;
  final AddressModel address;
  CheckPage({Key? key, required this.title, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Ком. услуга",
      "Пред. показ",
      "Тек. показ.",
      "Расход",
      "Тариф",
      "Сумма",
      "Задолженность",
      "Итого",
    ];
    List<String> infos = [
      title,
      (address.debtSum * .5).toString(),
      (address.debtSum * .7).toString(),
      (address.debtSum * .1).toString(),
      "18",
      "258.57",
      "-50.57",
      "208",
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Счёт за (${title.toLowerCase()})",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleAndInfo(title: "Организация: ", info: "Тазалык"),
                  TitleAndInfo(title: "ИНН: ", info: "02326409790799"),
                  TitleAndInfo(
                      title: "Наш адрес: ",
                      info: "г. Бишкек, Ленинский район, ул. Токтогула"),
                  TitleAndInfo(
                      title: "Телефон для справок: ", info: "+996 700 689 985"),
                  Image.asset("assets/linear_code.png"),
                  TitleAndInfo(
                      title: "Лицевой счет: ",
                      info: address.personalAccount.toString()),
                  TitleAndInfo(title: "ФИО: ", info: address.nameSurname),
                  TitleAndInfo(title: "Адрес: ", info: address.title),
                  TitleAndInfo(title: "Счёт выписан: ", info: "15-09-2022"),
                ],
              ),
              Column(
                children: [
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2.6,
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0),
                    itemCount: titles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TableTitleAndInfo(
                          title: titles[index], info: infos[index]);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 350,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                            title: "Подробная история",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DebtHistory(),
                                ),
                              );
                            },
                            fontSize: 15,
                            backgrondColor: Colors.grey),
                      ],
                    ),
                    Spacer(),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              "Оплатить:",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .5,
                            child: MyTextField(
                              hintText: "81 000сом",
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.backspace_outlined),
              label: Text(
                "Назад",
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey, padding: EdgeInsets.all(15)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChecktOfPaymentPage()));
              },
              icon: Icon(Icons.payments_outlined),
              label: Text(
                "Оплатить",
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue, padding: EdgeInsets.all(15)),
            ),
          ],
        ),
      ),
    );
  }
}

class TableTitleAndInfo extends StatelessWidget {
  final String title;
  final String info;
  const TableTitleAndInfo({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(),
              left: BorderSide(),
              right: BorderSide(),
            ),
          ),
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.all(5),
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Text(info, style: TextStyle()),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}

class TitleAndInfo extends StatelessWidget {
  final String title;
  final String info;
  const TitleAndInfo({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: title,
            style: Theme.of(context).textTheme.subtitle1,
            children: [
          TextSpan(text: info, style: TextStyle(fontWeight: FontWeight.bold))
        ]));
  }
}
