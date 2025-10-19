import 'package:flutter/material.dart';

class TopPropetyWidget extends StatefulWidget {
  final Function(int)? onChangeTab;
  const TopPropetyWidget({super.key, required this.onChangeTab});

  @override
  State<TopPropetyWidget> createState() => _TopPropetyWidgetState();
}

class _TopPropetyWidgetState extends State<TopPropetyWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8, right: 16),
        child: Row(
          children: [
            const Text(
              "Top Propeties",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                widget.onChangeTab!(1);
              },
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
