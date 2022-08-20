import 'package:demo_version/data/dates.dart';
import 'package:demo_version/models/check_date_model.dart';
import 'package:demo_version/pages/Clients/receipt_of_payment_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class DebtHistory extends StatelessWidget {
  const DebtHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Подробная  история задолженности",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SingleChildScrollView(
              
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: buildDataTable()),
            ),
            SizedBox(
              height: 30,
            ),
                        Spacer(),

            Text(
              "Итого общая сумма оплаты составляет:",
              style: TextStyle(fontSize: 20),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "81 000сом",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildDataTable() {
    final columns = ["Месяц", "Начисления", "Сумма\nвыплат"];
    return DataTable(
        columns: getColumns(columns), rows: getRows(allCheckDates));
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
      );
    }).toList();
  }

  List<DataRow> getRows(List<CheckDateModel> dates) =>
      dates.map((CheckDateModel date) {
        final cells = [date.month +"(${date.year})", date.accruedMoney, date.sum];
        return DataRow(
            cells: Utils.modelBuilder(cells, (index, cell) {
          return DataCell(Text("$cell"));
        }));
      }).toList();
}
