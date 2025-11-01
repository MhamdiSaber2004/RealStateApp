import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterfront/features/agents/data/top_agent_data.dart';
import 'package:flutterfront/features/agents/widgets/top_agent_card_widget.dart';

class TopListAgentWidget extends StatefulWidget {
  const TopListAgentWidget({super.key});

  @override
  State<TopListAgentWidget> createState() => _TopListAgentWidgetState();
}

class _TopListAgentWidgetState extends State<TopListAgentWidget> {
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
            return TopAgentCardWidget(agent: topAgents[index]);
          },
        ),
      ),
    );
  }
}
