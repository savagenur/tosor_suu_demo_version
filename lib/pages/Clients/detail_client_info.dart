import 'package:demo_version/models/address_model.dart';
import 'package:demo_version/pages/Clients/check_page.dart';
import 'package:demo_version/pages/Clients/choose_services_page.dart';
import 'package:demo_version/pages/Clients/create_request_page2.dart';
import 'package:demo_version/pages/Clients/water_meter_reading_page.dart';
import 'package:demo_version/widgets/my_widget.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

class DetailClientInfo extends StatefulWidget {
  final AddressModel addressModel;
  const DetailClientInfo({Key? key, required this.addressModel})
      : super(key: key);

  @override
  State<DetailClientInfo> createState() => _DetailClientInfoState();
}

class _DetailClientInfoState extends State<DetailClientInfo> {
  late TextEditingController nameSurnameController;
  late TextEditingController phoneNumberController;
  @override
  void initState() {
    nameSurnameController =
        TextEditingController(text: widget.addressModel.nameSurname);
    phoneNumberController =
        TextEditingController(text: widget.addressModel.phoneNumber.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ОО "Тосор Суу"'),
        centerTitle: true,
      ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextItem(
                                title: "ФИО: \n",
                                fontSize: 22,
                                text: widget.addressModel.nameSurname),
                            IconButton(
                                onPressed: () {
                                  editNameOrPhone(widget.addressModel, context,false);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            TextItem(
                                title: "Номер телефона: \n",
                                fontSize: 22,
                                text: '+' +
                                    widget.addressModel.phoneNumber.toString()),
                            IconButton(
                                onPressed: () {
                                  editNameOrPhone(widget.addressModel, context,true);

                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ))
                          ],
                        ),
                        TextItem(
                            title: "Лицевой счет: ",
                            fontSize: 22,
                            text:
                                widget.addressModel.personalAccount.toString()),
                        TextItem(
                            title: "Адрес: ",
                            fontSize: 22,
                            text: widget.addressModel.title),
                        TextItem(
                            title: "Задолженность: ",
                            fontSize: 22,
                            text:
                                "${(widget.addressModel.debtSum * .7).toInt()}"),
                        TextItem(
                            title: "За апрель месяц: ",
                            fontSize: 22,
                            text:
                                "${(widget.addressModel.debtSum * .3).toInt()}"),
                        TextItem(
                          title: "Итого общая сумма для оплаты: ",
                          fontSize: 22,
                          text: "${widget.addressModel.debtSum} ",
                          text2: "(уведомлен через смс)",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateRequestPage2(
                                    addressModel: widget.addressModel)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Создание заявки\nтех службе",
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.grey)),
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.electric_meter,
                              color:
                                  widget.addressModel.notEnteredMeterReadings ==
                                          1
                                      ? Colors.red
                                      : Colors.green,
                              size: 30,
                            ),
                            Text(
                              widget.addressModel.notEnteredMeterReadings == 1
                                  ? "Вбейте показания\nза август"
                                  : "Показания за\nавгуст вбиты",
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
                                builder: (context) => ChooseServicesPage(address: widget.addressModel)));
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

  Future editNameOrPhone(
      AddressModel addressModel, BuildContext context,bool isPhoneNumber) async {
    final nameSurname = showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isPhoneNumber?'+'+addressModel.phoneNumber.toString():"ФИО:"),
        content: TextField(
          controller: isPhoneNumber?phoneNumberController: nameSurnameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Готово"))
        ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
