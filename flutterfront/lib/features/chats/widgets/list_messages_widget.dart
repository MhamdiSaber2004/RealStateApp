import 'package:flutter/material.dart';
import 'package:flutterfront/features/chats/widgets/my_message_widget.dart';
import 'package:flutterfront/features/chats/widgets/other_massege_wigdet.dart';
import 'package:gap/gap.dart';

class ListMessagesWidget extends StatefulWidget {
  const ListMessagesWidget({super.key});

  @override
  State<ListMessagesWidget> createState() => _ListMessagesWidgetState();
}

class _ListMessagesWidgetState extends State<ListMessagesWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.all(15),
              child: Column(
                children:  [
                  MyMessageWidget(messages: 'hi'),
                  Gap(10),
                  MyMessageWidget(messages: "where is your location"),
                  Gap(10),
                  OtherMassegeWigdet(messages: 'hello sir'),
                  Gap(10),
                  OtherMassegeWigdet(messages: "we'are in street hbib bourgouba appartment 10 00000000000000000000000000000000")


                ],
              ),
            ),
          );
  }
}