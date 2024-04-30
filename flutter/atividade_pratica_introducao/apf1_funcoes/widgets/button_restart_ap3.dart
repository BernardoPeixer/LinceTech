// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class BotaoRestart extends StatefulWidget {
  final Function() resetGame;

  const BotaoRestart({super.key, required this.resetGame});

  @override
  State<BotaoRestart> createState() => _BotaoRestartState();
}

class _BotaoRestartState extends State<BotaoRestart> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.resetGame,
      child: const Text('Reiniciar', style: TextStyle(fontSize: 30, color: Colors.white),),
      style: TextButton.styleFrom(
        backgroundColor: Colors.indigo,
        fixedSize: Size(250, 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}
