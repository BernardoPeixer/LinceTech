// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class TesteButton extends StatefulWidget {
  final int index;
  final int expected;
  final Function(int) incrementarContador;
  final bool finalizou;

  const TesteButton({
    super.key,
    required this.index,
    required this.expected,
    required this.incrementarContador,
    required this.finalizou,
  });

  @override
  State<TesteButton> createState() => _TesteButtonState();
}

class _TesteButtonState extends State<TesteButton> {
  Color color = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if(widget.finalizou) {
          return;
        }
        widget.incrementarContador(widget.index);
        if (widget.index == widget.expected) {
          setState(() {
            color = Colors.green;
          });
        } else {
          setState(() {
            color = Colors.red;
          });
        }
      },
      child: Text(
        'Me aperte',
        style: TextStyle(fontSize: 20),
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
