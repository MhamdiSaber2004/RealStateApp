import 'package:flutter/material.dart';

class MyMessageWidget extends StatefulWidget {
  final String messages ;
  const MyMessageWidget({super.key , required this.messages});

  @override
  State<MyMessageWidget> createState() => _MyMessageWidgetState();
}

class _MyMessageWidgetState extends State<MyMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.messages,
            style: TextStyle(
              color: Colors.white, 
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}