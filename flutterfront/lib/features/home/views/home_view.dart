import 'package:flutter/material.dart';
import 'package:flutterfront/features/home/widgets/list_agent_widget.dart';
import 'package:flutterfront/features/home/widgets/list_prooerties_widget.dart';
import 'package:flutterfront/features/home/widgets/search_widget.dart';
import 'package:flutterfront/features/home/widgets/top_propety_widget.dart';

class HomeView extends StatefulWidget {
  final Function(int)? onChangeTab;
  const HomeView({super.key, this.onChangeTab});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SearchWidget(),

          TopPropetyWidget(onChangeTab: widget.onChangeTab),

          ListProoertiesWidget(),

          TopPropetyWidget(onChangeTab: widget.onChangeTab),

          ListAgentWidget(),
        ],
      ),
    );
  }
}
