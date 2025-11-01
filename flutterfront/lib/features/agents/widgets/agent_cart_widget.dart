import 'package:flutter/material.dart';
import 'package:flutterfront/features/agents/views/consolt_agent_view.dart';
import 'package:flutterfront/models/AgentsModel.dart';

class AgentCartWidget extends StatefulWidget {
  final Agent agent;
  const AgentCartWidget({super.key ,required this.agent});

  @override
  State<AgentCartWidget> createState() => _AgentCartWidgetState();
}

class _AgentCartWidgetState extends State<AgentCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shadowColor: Colors.black45,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ConsoltAgentView(agent: widget.agent),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(widget.agent.avatar),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.agent.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.agent.email,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.agent.phoneNumber,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
                ),
        )
      ),
    );
  }
}