import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final double? size;
  final double? width;
  final double? height;
  final IconData? icon;
  const MyWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.color = Colors.white,
    this.size = 20,
    this.width,
    this.textColor = Colors.black,
    this.height=70, this.icon=Icons.circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: .5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(blurRadius: 4,offset: Offset(0, 2),color: Colors.black.withOpacity(.7))],
            color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(height: 3,),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
