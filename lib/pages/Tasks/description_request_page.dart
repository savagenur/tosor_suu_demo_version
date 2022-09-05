import 'package:demo_version/pages/Tasks/create_request_page.dart';
import 'package:demo_version/widgets/my_button.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

class DescriptionRequestPage extends StatefulWidget {
  final String status;
  final Color statusColor;
  final String address;
  final String problemDesc;
  final String nameSurname;
  final int phoneNumber;
  final bool isSolved;

  const DescriptionRequestPage({
    Key? key,
    required this.status,
    required this.address,
    required this.problemDesc,
    this.isSolved = false,
    required this.statusColor,
    required this.nameSurname,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<DescriptionRequestPage> createState() => _DescriptionRequestPageState();
}

class _DescriptionRequestPageState extends State<DescriptionRequestPage> {
  late TextEditingController commentController;
  late String status;
  @override
  void initState() {
    commentController = TextEditingController(
        text:
            'Мы исправили все неполадки, и решили все проблемы связанные с "' +
                widget.problemDesc +
                '".');
    status = widget.status;

    super.initState();
  }

  String selectedValue = statuses.first;
  static const List<String> statuses = [
    "Завершенный",
    "Открытый",
    "В работе",
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Описание заявки"),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                widget.isSolved
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: TitleAndDescWidget(
                              title: "Статус",
                              isStatus: true,
                              text: status,
                              color: widget.statusColor,
                            ),
                          ),
                          Positioned(
                              right: 0,
                              child: PopupMenuButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  itemBuilder: (context) {
                                    return buildPopupMenuItem();
                                  }))
                        ],
                      )
                    : TitleAndDescWidget(
                        title: "Статус",
                        isStatus: true,
                        text: widget.status,
                        color: widget.statusColor,
                      ),
                TitleAndDescWidget(
                  title: "ФИО",
                  text: widget.nameSurname,
                ),
                TitleAndDescWidget(
                  title: "Адрес",
                  text: widget.address,
                ),
                TitleAndDescWidget(
                  title: "Контактный номер",
                  text: '+${widget.phoneNumber}',
                ),
                widget.isSolved
                    ? Column(
                        children: [
                          Text(
                            'Комментарий',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              maxLines: 4,
                              controller: commentController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : TitleAndDescWidget(
                        title: "Описание проблемы",
                        text: widget.problemDesc,
                      ),
                Text("20.03.22"),
                SizedBox(
                  height: 20,
                ),
                widget.isSolved
                    ? Container()
                    : Row(
                        mainAxisAlignment: widget.isSolved
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                              title: "Редактировать",
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CreateRequestPage(),
                                  ),
                                );
                              },
                              backgrondColor: Colors.grey),
                          MyButton(
                              title: "Удалить заявку",
                              onTap: () {},
                              backgrondColor: Colors.red),
                        ],
                      )
              ],
            ),
          ),
        ),
        bottomNavigationBar: RoutesWidget(
          currentIndex: 2,
        ),
      ),
    );
  }

  buildPopupMenuItem() {
    return statuses.map((value) {
      return PopupMenuItem(
        child: RadioListTile(
          value: value,
          groupValue: selectedValue,
          title: Text(value),
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
              status = selectedValue;
            });
            Navigator.pop(context);
          },
        ),
      );
    }).toList();
  }
}

class TitleAndDescWidget extends StatelessWidget {
  final String title;
  final String text;
  final Color? color;
  final bool isStatus;
  const TitleAndDescWidget({
    Key? key,
    required this.title,
    required this.text,
    this.color = Colors.white,
    this.isStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
          color: color,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: isStatus ? Colors.white : Colors.black),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
