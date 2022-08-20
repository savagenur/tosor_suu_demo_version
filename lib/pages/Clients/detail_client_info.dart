import 'package:demo_version/models/address_model.dart';
import 'package:demo_version/pages/Clients/check_page.dart';
import 'package:demo_version/pages/Clients/water_meter_reading_page.dart';
import 'package:demo_version/widgets/my_widget.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

class DetailClientInfo extends StatelessWidget {
  final AddressModel addressModel;
  const DetailClientInfo({Key? key, required this.addressModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Подробная история платежей определенного абонента:",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextItem(
                            title: "Адрес: ",
                            fontSize: 22,
                            text: addressModel.title),
                        TextItem(
                            title: "Задолженность: ",
                            fontSize: 22,
                            text: "${(addressModel.debtSum*.7).toInt()}"),
                        TextItem(
                            title: "За апрель месяц: ",
                            fontSize: 22,
                            text: "${(addressModel.debtSum*.3).toInt()}"),
                        TextItem(
                          title: "Итого общая сумма для оплаты: ",
                          fontSize: 22,
                          text: "${addressModel.debtSum} ",
                          text2: "(уведомлен через смс)",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.electric_meter,
                              color:addressModel.notEnteredMeterReadings==1?Colors.red: Colors.green,
                              size: 30,
                            ),
                            Text(
                             addressModel.notEnteredMeterReadings==1?"Вбейте показания\nза август": "Показания за\nавгуст вбиты",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyWidget(
                          title: "Продолжить маршрут",
                          textColor: Colors.white,
                          height: 95,
                          onTap: () {},
                          width: 100,
                          icon: Icons.route,
                          size: 12,
                          color: Colors.blue,
                        ),
                        MyWidget(
                          textColor: Colors.white,
                          title: "Принять оплату наличными",
                          height: 95,
                          icon: Icons.payments_rounded,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CheckPage()));
                          },
                          width: 100,
                          size: 12,
                          color: Colors.blue,
                        ),
                        MyWidget(
                          textColor: Colors.white,
                          title: "Вбить показания счетчика",
                          height: 95,
                          icon: Icons.electric_meter_outlined,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => WaterMeterReadingPage()));
                          },
                          width: 100,
                          size: 12,
                          color: Colors.blue,
                        ),
                      ],
                    )
                  ],
                ),
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
}

class TextItem extends StatelessWidget {
  final String title;
  final String text;
  final String? text2;
  final double fontSize;

  const TextItem({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.text,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
            text: TextSpan(
                text: title,
                style: TextStyle(fontSize: fontSize, color: Colors.black),
                children: [
              TextSpan(
                text: text,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: text2,
              ),
            ])),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
