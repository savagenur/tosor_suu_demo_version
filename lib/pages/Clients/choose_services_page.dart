import 'package:demo_version/models/address_model.dart';
import 'package:flutter/material.dart';

import 'check_page.dart';

class ChooseServicesPage extends StatelessWidget {
  final AddressModel address;
  const ChooseServicesPage({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Выберете услугу'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckPage(
                            address: address,
                            title: "Холодная вода",
                          )));
                },
                child: Text("Холодная вода"),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckPage(
                            address: address,
                            title: "Мусор",
                          )));
                },
                child: Text("Мусор"),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckPage(
                            address: address,
                            title: "Полив",
                          )));
                },
                child: Text("Полив"),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckPage(
                            address: address,
                            title: "Пастбище",
                          )));
                },
                child: Text("Пастбище"),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckPage(
                            address: address,
                            title: "Канализация",
                          )));
                },
                child: Text("Канализация"),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckPage(
                            address: address,
                            title: "Отопление",
                          )));
                },
                child: Text("Отопление"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
