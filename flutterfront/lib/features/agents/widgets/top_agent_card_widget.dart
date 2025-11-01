import 'package:flutter/material.dart';
import 'package:flutterfront/features/agents/views/consolt_agent_view.dart';
import 'package:flutterfront/models/AgentsModel.dart';
import 'package:gap/gap.dart';

class TopAgentCardWidget extends StatefulWidget {
  final Agent agent;

  const TopAgentCardWidget({super.key, required this.agent});

  @override
  State<TopAgentCardWidget> createState() => _TopAgentCardWidgetState();
}

class _TopAgentCardWidgetState extends State<TopAgentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
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
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(widget.agent.avatar),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.agent.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    widget.agent.email,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 16,
                        color: Colors.blueAccent,
                      ),
                      const Gap(6),
                      Expanded(
                        child: Text(
                          widget.agent.phoneNumber,
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
