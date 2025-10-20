import 'package:flutter/material.dart';
import 'package:flutterfront/features/home/widgets/search_widget.dart';
import 'package:flutterfront/features/propertys/widgets/list_prooerties_widget.dart';
import 'package:flutterfront/features/propertys/widgets/list_top_property_widget.dart';
import 'package:flutterfront/features/propertys/widgets/top_propety_widget.dart';

class ListPropertyPage extends StatefulWidget {
  const ListPropertyPage({super.key});

  @override
  State<ListPropertyPage> createState() => _ListPropertyPageState();
}

class _ListPropertyPageState extends State<ListPropertyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          TopPropetyWidget(),
          ListTopPropertyWidget(),
          SearchWidget(),
          ListProoertiesWidget(),
        ],
      ),
    );
  }
}
