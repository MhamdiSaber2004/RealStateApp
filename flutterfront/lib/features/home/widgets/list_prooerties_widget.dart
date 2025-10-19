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
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: properties.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return PropertyCardWidget(property: properties[index]);
          },
        ),
      ),
    );
  }
}
