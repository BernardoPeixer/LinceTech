// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CirculoAp3 extends StatelessWidget {
   Color cor;
  
  CirculoAp3({super.key, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(180),
      ),
    );
  }
}
