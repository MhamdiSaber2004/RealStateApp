import 'package:flutter/material.dart';

class OtherMassegeWigdet extends StatefulWidget {
  final String messages;
  const OtherMassegeWigdet({super.key ,required this.messages});

  @override
  State<OtherMassegeWigdet> createState() => _OtherMassegeWigdetState();
}

class _OtherMassegeWigdetState extends State<OtherMassegeWigdet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
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
            softWrap: true,
          ),
        ),
      ],
    );
  }
}