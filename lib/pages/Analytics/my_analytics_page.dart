import 'package:demo_version/pages/Analytics/analytics_page.dart';
import 'package:demo_version/pages/home_page.dart';
import 'package:demo_version/widgets/routes_widget.dart';
import 'package:flutter/material.dart';

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
                SizedBox(height: 20,),
                GraphicWidget(
                  screenSize: screenSize,
                  number: "8 / 10",
                  title: "Решено проблем",
                ),
                    SizedBox(height: 20,),
                GraphicWidget(
                  screenSize: screenSize,
                  number: "100 / 144",
                  title: "Внесено показаний",
                ),
                    SizedBox(height: 20,),GraphicWidget(
                  screenSize: screenSize,
                  number: "230000 / 400000",
                  title: "Собрано за август 2022",
                ),
                    SizedBox(height: 20,),

                Column(
                  children: [
                    ExpansionTile(
                      collapsedBackgroundColor: Colors.grey[300],
                      title: Text("Нерешенные заявки"),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                      expandedAlignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Ул. Ленина д7 кв99',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(),
                        ),
                        SizedBox(height: 5,),
                        Text('с. Лебединовка 66',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith()),
                      ],
                    ),
                    SizedBox(height: 20,),
                    ExpansionTile(
                      collapsedBackgroundColor: Colors.grey[300],
                      title: Text("Не сняты показания"),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                      expandedAlignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Ул. Ленина д7 кв99',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(),
                        ),
                        SizedBox(height: 5,),
                        Text('с. Лебединовка 66',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith()),
                      ],
                    ), SizedBox(height: 20,),
                    ExpansionTile(
                      collapsedBackgroundColor: Colors.grey[300],
                      title: Text("Задолженности"),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                      expandedAlignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Ул. Ленина д7 кв99',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(),
                        ),
                        SizedBox(height: 5,),
                        Text('с. Лебединовка 66',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith()),
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
}
