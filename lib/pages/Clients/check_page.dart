import 'package:demo_version/data/dates.dart';
import 'package:demo_version/models/check_date_model.dart';
import 'package:demo_version/pages/Clients/check_of_payment_page.dart';
import 'package:demo_version/pages/Clients/debt_history.dart';
import 'package:demo_version/pages/Clients/receipt_of_payment_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:demo_version/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Счёт",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .9,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Имеется задолженность за 2 месяца (май, июнь 2022г)",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  text: TextSpan(
                      text: "Общая сумма задолженности",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      children: [
                        TextSpan(
                            text: " 20 000сом",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ))
                      ]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                RichText(
                  text: TextSpan(
                      text: "Начисление за август ",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      children: [
                        TextSpan(
                            text: " 21 000сом",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ))
                      ]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Итого общая сумма оплаты составляет:",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 350,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyButton(
                              title: "Подробная история\nзадолженности",
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DebtHistory(),
                                  ),
                                );
                              },
                              fontSize: 15,
                              backgrondColor: Colors.grey),
                          Text(
                            "81 000сом",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
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
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
