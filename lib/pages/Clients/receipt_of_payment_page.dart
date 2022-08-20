import 'package:demo_version/data/dates.dart';
import 'package:demo_version/models/check_date_model.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ReceiptOfPayment extends StatelessWidget {
  final String title;
  final String submitTitle;
  final VoidCallback onTap;

  const ReceiptOfPayment({Key? key, required this.title, required this.submitTitle, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAndTextWidget(
              title: "Время операции",
              text: "28 июл 2022 12:33",
            ),
            TitleAndTextWidget(
              title: "Квитанция",
              text: "№24681262365236592759275",
            ),
            TitleAndTextWidget(
              title: "Поставщик услуг",
              text: 'ОАО "_________"',
            ),
            TitleAndTextWidget(
              title: "Номер счета",
              text: "456789090217",
            ),
            TitleAndTextWidget(
              title: "Сумма",
              text: "81000,00 KGS",
            ),
            TitleAndTextWidget(
              title: "Сумма включая комиссию",
              text: "81000,50 KGS",
            ),
            Spacer(),
            Row(
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
                  onPressed: onTap,
                  icon: Icon(Icons.check),
                  label: Text(
                    submitTitle,
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, padding: EdgeInsets.all(15)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TitleAndTextWidget extends StatelessWidget {
  final String title;
  final String text;
  const TitleAndTextWidget({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
