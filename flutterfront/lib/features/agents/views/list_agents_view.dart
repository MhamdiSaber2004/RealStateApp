import 'package:flutter/material.dart';
import 'package:flutterfront/features/agents/widgets/top_agents_widget.dart';
import 'package:flutterfront/features/home/widgets/list_agent_widget.dart';

class ListAgentsPage extends StatefulWidget {
  const ListAgentsPage ({super.key});

  @override
  State<ListAgentsPage> createState() => _ListAgentsPageState();
}

class _ListAgentsPageState extends State<ListAgentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            TopAgentsWidget(),
            ListAgentWidget()
          ],
        ),
      )
    );
  }
}