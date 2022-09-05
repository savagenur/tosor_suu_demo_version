import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color backgrondColor;
  final double? fontSize;
  final double? width;
  final bool isTaskButton;
  const MyButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.backgrondColor,
    this.fontSize = 18,
    this.width,  this.isTaskButton=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          child: TextButton(
            onPressed: onTap,
            child: Column(
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
               isTaskButton? Text("(20.03.22)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                    )):Container(),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(backgrondColor),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
