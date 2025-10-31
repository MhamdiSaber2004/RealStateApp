import 'package:flutter/material.dart';

class TopAgentsWidget extends StatefulWidget {
  const TopAgentsWidget({super.key});

  @override
  State<TopAgentsWidget> createState() => _TopAgentsWidgetState();
}

class _TopAgentsWidgetState extends State<TopAgentsWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8, right: 16),
        child: Row(
          children: [
            const Text(
              "Top Agents",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
