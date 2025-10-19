import 'package:flutter/material.dart';
import 'package:flutterfront/shared/appbar_widget.dart';

class ConsolterPropertypage extends StatefulWidget {
  final String propertyName;
  const ConsolterPropertypage({super.key , required this.propertyName});

  @override
  State<ConsolterPropertypage> createState() => _ConsolterPropertypageState();
}

class _ConsolterPropertypageState extends State<ConsolterPropertypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.propertyName, ) ,
    );
  }
}