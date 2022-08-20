import 'package:demo_version/data/dates.dart';
import 'package:demo_version/models/date_model.dart';
import 'package:demo_version/utils/utils.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

class WaterMeterReadingPage extends StatefulWidget {
  const WaterMeterReadingPage({Key? key}) : super(key: key);

  @override
  State<WaterMeterReadingPage> createState() => _WaterMeterReadingPageState();
}

class _WaterMeterReadingPageState extends State<WaterMeterReadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ОО "Тосор Суу"'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Показание водомера:",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  buildDataTable(),
                  ElevatedButton(
                      onPressed: () {}, child: Text("Добавить показания"))
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: RoutesWidget(currentIndex: 1,),
    );
  }

  Widget buildDataTable() {
    final columns = ["Месяц", "Показания\nсчетчика", "Дата"];
    return DataTable(columns: getColumns(columns), rows: getRows(allDates));
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
      );
    }).toList();
  }

  List<DataRow> getRows(List<DateModel> dates) => dates.map((DateModel date) {
        final cells = [date.month, date.amount, date.date];
        return DataRow(
            cells: Utils.modelBuilder(cells, (index, cell) {
          return DataCell(cell=="---"?Container(
            width: 50,
            child: TextField(
              keyboardType: TextInputType.number,
            )):Text("$cell"));
        },),);
      }).toList();
}
