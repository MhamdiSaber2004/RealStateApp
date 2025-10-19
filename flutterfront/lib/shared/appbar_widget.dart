import 'package:flutter/material.dart';
import 'package:flutterfront/core/constants/app_colors.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.keyboard_backspace_rounded, color: Colors.black),
      ),
      title: Text(
        widget.title,
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.text),
      ),
      backgroundColor: AppColors.secondary,
    );
  }
}
