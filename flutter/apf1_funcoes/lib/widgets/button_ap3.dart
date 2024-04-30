// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class BotaoDeEscolha extends StatefulWidget {
  final Function(int) onUserTry;
  final int index;
  final int botaoCorreto;

  const BotaoDeEscolha(
      {super.key,
      required this.onUserTry,
      required this.index,
      required this.botaoCorreto});

  @override
  State<BotaoDeEscolha> createState() => _BotaoDeEscolhaState();
}

class _BotaoDeEscolhaState extends State<BotaoDeEscolha> {
  Color color = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.onUserTry(widget.index);
          if (widget.index == widget.botaoCorreto) {
            setState(() {
              color = Colors.green;
            });
          } else {
            setState(() {
              color = Colors.red;
            });
          }
          
        }, child: Text(
        'Me aperte',
        style: TextStyle(fontSize: 15),
      ),
      style: TextButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(120, 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
        );
  }
}
