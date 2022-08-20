import 'package:demo_version/data/dates.dart';
import 'package:demo_version/models/check_date_model.dart';
import 'package:demo_version/pages/Clients/receipt_of_payment_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ChecktOfPaymentPage extends StatelessWidget {
  const ChecktOfPaymentPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReceiptOfPayment(
        title: "Счет на оплату",
        submitTitle: "Подтвердить\nоплату",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ReceiptOfPayment(
                  title: "Квитанция",
                  submitTitle: "Поделиться",
                  onTap: () {})));
        });
  }
}
