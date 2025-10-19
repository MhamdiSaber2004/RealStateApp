import 'package:flutter/material.dart';
import 'package:flutterfront/features/home/data/property_data.dart';
import 'package:flutterfront/features/home/widgets/property_card_widget.dart';

class ListProoertiesWidget extends StatefulWidget {
  const ListProoertiesWidget({super.key});

  @override
  State<ListProoertiesWidget> createState() => _ListProoertiesWidgetState();
}

class _ListProoertiesWidgetState extends State<ListProoertiesWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: properties
              .map(
                (property) => SizedBox(
                  width: (MediaQuery.of(context).size.width - 16 * 3) / 2,
                  child: PropertyCardWidget(property: property),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
