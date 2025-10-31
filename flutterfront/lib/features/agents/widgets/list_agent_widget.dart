import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterfront/features/agents/data/top_agent_data.dart';
import 'package:flutterfront/features/agents/widgets/agent_card_widget.dart';

class ListAgentWidget extends StatefulWidget {
  const ListAgentWidget({super.key});

  @override
  State<ListAgentWidget> createState() => _ListAgentWidgetState();
}

class _ListAgentWidgetState extends State<ListAgentWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 160,
        child: CarouselSlider.builder(
          itemCount: topAgents.length,
          options: CarouselOptions(
            height: 130,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 0.9,
          ),
          itemBuilder: (context, index, realIdx) {
            return AgentCardWidget(agent: topAgents[index]);
          },
        ),
      ),
    );
  }
}
