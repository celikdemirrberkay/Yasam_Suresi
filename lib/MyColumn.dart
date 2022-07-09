import 'package:flutter/material.dart';
import 'package:yasam_suresi/constants.dart';

class MyColumn extends StatelessWidget {

  final IconData myIcon;
  final String sex;
  MyColumn({ required this.myIcon,required this.sex});


  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          color: Colors.black54,
          size: 50,
        ),
        SizedBox(height: 12),
        Text(
          sex,
          style: kMetinStyle
        ),
      ],
    );
  }
}