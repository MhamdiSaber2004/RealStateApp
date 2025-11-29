import 'package:flutter/material.dart';
import 'package:flutterfront/shared/appbar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Settings"),
      body : Center(
        child: Column(
          children: [
            
          ],
        ),
      ),
      );
  }
}
