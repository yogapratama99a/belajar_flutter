import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Text(
        'Home',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}