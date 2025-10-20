import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterfront/features/home/widgets/property_card_widget.dart';
import 'package:flutterfront/features/propertys/data/top_property_data.dart';

class ListTopPropertyWidget extends StatefulWidget {
  const ListTopPropertyWidget({super.key});

  @override
  State<ListTopPropertyWidget> createState() => _ListTopPropertyWidgetState();
}

class _ListTopPropertyWidgetState extends State<ListTopPropertyWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 350,
        child: CarouselSlider.builder(
          itemCount: topProperties.length,
          options: CarouselOptions(
            height: (MediaQuery.of(context).size.height - 16 * 3),
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 0.65,
          ),
          itemBuilder: (context, index, realIdx) {
            return PropertyCardWidget(property: topProperties[index]);
          },
        ),
      ),
    );
  }
}
