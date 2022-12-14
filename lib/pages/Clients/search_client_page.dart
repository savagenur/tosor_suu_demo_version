import 'package:demo_version/data/addresses.dart';
import 'package:demo_version/models/address_model.dart';
import 'package:demo_version/models/check_box_state_model.dart';
import 'package:demo_version/pages/Clients/add_new_client_page.dart';
import 'package:demo_version/pages/Clients/detail_client_info.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:demo_version/widgets/my_text_field.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

class SearchClientPage extends StatefulWidget {
  SearchClientPage({Key? key}) : super(key: key);

  @override
  State<SearchClientPage> createState() => _SearchClientPageState();
}

class _SearchClientPageState extends State<SearchClientPage> {
  bool value = false;
  FocusNode focusNode = FocusNode();
  String query = '';
  TextEditingController controller = TextEditingController();
  List<AddressModel> addresses = allAddresses;
  final filters = [
    CheckBoxState(
      title: "Сумма долга",
    ),
    CheckBoxState(title: "Не вбитые\nпоказания счетчиков"),
    CheckBoxState(title: "Алфавитный порядок",value: true),
    CheckBoxState(title: "Улицы", ),
    CheckBoxState(title: "Участки", ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isAlphaSort = filters[2].value;
    bool isNotEnteredMeterReadings = filters[1].value;
    bool isDebtSort = filters[0].value;

    final sortedAddresses = addresses
      ..sort(((a, b) {
        if (isAlphaSort) {
          return a.title.compareTo(b.title);
        } else if (isDebtSort) {
          return b.debtSum.compareTo(a.debtSum);
        } else if (isNotEnteredMeterReadings) {
          return b.notEnteredMeterReadings.compareTo(a.notEnteredMeterReadings);
        } else {
          return b.notEnteredMeterReadings.compareTo(a.notEnteredMeterReadings);
        }
      }));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          if (addresses.isEmpty) {}
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            PopupMenuButton(
                              onCanceled: () {
                                setState(() {});
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Text("Фильтр"),
                                    Icon(Icons.arrow_drop_down_sharp),
                                  ],
                                ),
                              ),
                              itemBuilder: (context) =>
                                  // [
                                  // ...filters.map(buildSingleCheckBox).toList()
                                  //     ]
                                  List.generate(
                                filters.length,
                                (index) => PopupMenuItem(
                                  child: StatefulBuilder(builder:
                                      (BuildContext context, setState) {
                                    return CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: filters[index].value,
                                      onChanged: (value) => setState(() {
                                        for (var element in filters) {
                                          element.value = false;
                                        }
                                        filters[index].value = value!;

                                        Navigator.of(context).pop();
                                      }),
                                      title: Text(filters[index].title),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MyButton(
                        title: "Добавить абонента",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddNewClientPage(),
                            ),
                          );
                        },
                        backgrondColor: Colors.blue,
                        fontSize: 15,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: TextFormField(
                      controller: controller,
                      onFieldSubmitted: (value) {},
                      focusNode: focusNode,
                      onChanged: searchItem,
                      decoration: InputDecoration(
                        hintText: "Поиск",
                        border: InputBorder.none,
                        suffixIcon: focusNode.hasFocus
                            ? GestureDetector(
                                onTap: () {
                                  controller.clear();
                                  setState(() {
                                    addresses = allAddresses;
                                  });
                                },
                                child: Icon(Icons.clear))
                            : GestureDetector(
                                onTap: () {}, child: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Результаты поиска:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpansionPanelList(

                          expansionCallback: (panelIndex, isExpanded) {
                            setState(
                              () {
                                sortedAddresses[panelIndex].isExpanded =
                                    !sortedAddresses[panelIndex].isExpanded;
                              },
                            );
                          },animationDuration: Duration(seconds:1),
                          children: sortedAddresses.map((address) {
                            return ExpansionPanel(
                              canTapOnHeader: true,
                              
                                headerBuilder: (context, isExpanded) {
                                  return Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(address.title));
                                },
                                body: Column(
                                  children: List.generate(
                                      address.subAddresses.length, (index) {
                                    var subaddress =
                                        address.subAddresses[index];
                                    return SizedBox(
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 95,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: isDebtSort
                                                      ? 190
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1.5,
                                                  child: Text(
                                                    subaddress,
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                Spacer(),
                                                isDebtSort
                                                    ? Text(
                                                        ' ${address.debtSum}сом',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      )
                                                    : Container(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            flex: 25,
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child:address.isMeterReading ? Icon(
                                                      Icons
                                                          .electric_meter_outlined,
                                                      color:
                                                          address.notEnteredMeterReadings ==
                                                                  1
                                                              ? Colors.red
                                                              : Colors.green):Icon(
                                                      Icons
                                                          .power_off,
                                                      color: Colors.grey,),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DetailClientInfo(
                                                                    addressModel:
                                                                        address,
                                                                  )));
                                                    },
                                                    icon: Icon(
                                                      Icons.info_outline,
                                                      color: Colors.blue,
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                isExpanded: address.isExpanded
                                );
                          }).toList()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: RoutesWidget(
          currentIndex: 1,
        ),
      ),
    );
  }

  void searchItem(String query) {
    final suggestions = allAddresses.where((address) {
      final item = address.title.toLowerCase();
      final input = query.toLowerCase();
      return item.contains(input);
    }).toList();
    setState(() {
      addresses = suggestions;
    });
  }

  PopupMenuItem buildSingleCheckBox(CheckBoxState checkBoxState) {
    return PopupMenuItem(
      child: StatefulBuilder(builder: (BuildContext context, setState) {
        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: checkBoxState.value,
          onChanged: (value) => setState(() {
            checkBoxState.value = value!;

            Navigator.of(context).pop();
          }),
          title: Text(checkBoxState.title),
        );
      }),
    );
  }
}
