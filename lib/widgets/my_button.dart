import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color backgrondColor;
  final double? fontSize;
  final double? width;
  const MyButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.backgrondColor, this.fontSize=18, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          child: TextButton(
            
            
            onPressed: onTap,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: fontSize,),
              
              textAlign: TextAlign.center,
            ),
            
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(backgrondColor),
                
                ),
          ),
        ),
        
      ],
    );
  }
}
