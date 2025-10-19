import 'package:flutter/material.dart';
import 'package:flutterfront/shared/appbar_widget.dart';

class ConsoltAgentView extends StatefulWidget {
  final String agentName;
  const ConsoltAgentView({super.key , required this.agentName});

  @override
  State<ConsoltAgentView> createState() => _ConsoltAgentViewState();
}

class _ConsoltAgentViewState extends State<ConsoltAgentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.agentName),
    );
  }
}