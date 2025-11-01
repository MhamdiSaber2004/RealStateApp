import 'package:flutter/material.dart';
import 'package:flutterfront/features/agents/data/agents_data.dart';
import 'package:flutterfront/features/agents/widgets/agent_cart_widget.dart';

class ListAgentsWidget extends StatefulWidget {
  const ListAgentsWidget({super.key});

  @override
  State<ListAgentsWidget> createState() => _ListAgentsWidgetState();
}

class _ListAgentsWidgetState extends State<ListAgentsWidget> {
  @override
  Widget build(BuildContext context) {
    return (
      SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
        sliver: SliverToBoxAdapter(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: topAgents.map((agent) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 48) / 2,
                child: AgentCartWidget(agent: agent),
              );
            }).toList(),
          ),
        ),
      )
    );
  }
}
