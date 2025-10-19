import 'package:flutter/material.dart';

class ListAgentsPage extends StatefulWidget {
  const ListAgentsPage ({super.key});

  @override
  State<ListAgentsPage> createState() => _ListAgentsPageState();
}

class _ListAgentsPageState extends State<ListAgentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("agent view"),
      ),
    );
  }
}