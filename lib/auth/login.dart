import 'package:demo_version/pages/Tasks/send_request_page.dart';
import 'package:demo_version/pages/analytics_page.dart';
import 'package:demo_version/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(flex: 4,),
            TextField(
              decoration: InputDecoration(
                hintText: "Логин",
                border: OutlineInputBorder( ),
              ),
            ),
            Spacer(flex: 1,),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder( ),
                hintText: "Пароль",
              ),
            ),
            Spacer(flex: 1,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder( ),
                hintText: "Организация",
              ),
            ),
            Spacer(flex: 1,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AnalyticsPage()));
                },
                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 20)),
                child: Text("Вход",style: TextStyle(fontSize: 20),),
              ),
            ),
            Spacer(flex: 4,),
          ],
        ),
      ),
    );
  }
}
