import 'package:flutter/material.dart';
import 'package:flutterfront/shared/appbar_widget.dart';

class Registrer extends StatefulWidget {
  const Registrer({super.key});

  @override
  State<Registrer> createState() => _RegistrerState();
}

class _RegistrerState extends State<Registrer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const AppBarWidget(title: "Sing Up"));
  }
}
