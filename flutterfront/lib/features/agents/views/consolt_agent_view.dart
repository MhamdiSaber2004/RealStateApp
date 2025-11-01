import 'package:flutter/material.dart';
import 'package:flutterfront/features/agents/widgets/top_agent_card_widget.dart';
import 'package:flutterfront/features/home/widgets/list_prooerties_widget.dart';
import 'package:flutterfront/models/AgentsModel.dart';
import 'package:flutterfront/shared/appbar_widget.dart';

class ConsoltAgentView extends StatefulWidget {
  final Agent agent;
  const ConsoltAgentView({super.key , required this.agent});

  @override
  State<ConsoltAgentView> createState() => _ConsoltAgentViewState();
}

class _ConsoltAgentViewState extends State<ConsoltAgentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.agent.name),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(padding: const EdgeInsets.all(16),
              child: TopAgentCardWidget(agent: widget.agent),
            ),
          ),
          ListProoertiesWidget()
        ],
          
          
       
      ),
    );
  }
}