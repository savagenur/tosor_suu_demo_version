import 'package:demo_version/pages/Analytics/analytics_page.dart';
import 'package:demo_version/pages/Clients/detail_client_info.dart';
import 'package:demo_version/pages/home_page.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

import '../../models/address_model.dart';

class MyAnalyticsPage extends StatelessWidget {
  const MyAnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Моя сводка",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                GraphicWidget(
                  screenSize: screenSize,
                  number: "8 / 10",
                  title: "Решено проблем",
                ),
                SizedBox(
                  height: 20,
                ),
                GraphicWidget(
                  screenSize: screenSize,
                  number: "100 / 144",
                  title: "Внесено показаний",
                ),
                SizedBox(
                  height: 20,
                ),
                GraphicWidget(
                  screenSize: screenSize,
                  number: "230 000 / 400 000",
                  title: "Собрано за август - 2022 год",
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionTile(
                      collapsedBackgroundColor: Colors.red[200],
                      title: Text("Задолженности", ),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                      expandedAlignment: Alignment.centerLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildAddressButton(
                            context, 'Ул. Ленина д7 кв99 - 10 200с', false),
                        buildAddressButton(
                            context, 'с. Лебединовка 66 - 5 034с', false),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),ExpansionTile(
                      collapsedBackgroundColor: Colors.grey[300],
                      title: Text("Не сняты показания"),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                      expandedAlignment: Alignment.centerLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildAddressButton(
                            context, 'Ул. Ленина д7 кв99 ', true),
                        buildAddressButton(
                            context, 'с. Лебединовка 66 ', true),
                      ],
                    ),SizedBox(
                      height: 20,
                    ),
                    ExpansionTile(
                      collapsedBackgroundColor: Colors.yellow[300],
                      title: Text(
                        "Нерешенные заявки",
                      ),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                      expandedAlignment: Alignment.centerLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildAddressButton(
                            context, 'Ул. Ленина д7 кв99', false),
                        buildAddressButton(
                            context, 'с. Лебединовка 66', false),
                      ],
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

  TextButton buildAddressButton(
      BuildContext context, String title,bool isUnpaid) {
    return TextButton(
        onPressed: (() => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailClientInfo(
                    addressModel: AddressModel(
                  title: title,
                  notEnteredMeterReadings:isUnpaid?1: -1,
                  debtSum: 8000,
                  nameSurname: "Азаматов Азамат",
                  phoneNumber: 996787878,
                  personalAccount: 239613652151,
                  subAddresses: []
                ))))),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(decoration: TextDecoration.underline),
        ));
  }
}
