import 'package:flutter/material.dart';
import 'package:flutterfront/features/propertys/widgets/property_detail_widget.dart';
import 'package:flutterfront/shared/appbar_widget.dart';

class ConsolterPropertypage extends StatefulWidget {
  final String propertyName;
  final String propertyId;
  const ConsolterPropertypage({
    super.key,
    required this.propertyName,
    required this.propertyId,
  });

  @override
  State<ConsolterPropertypage> createState() => _ConsolterPropertypageState();
}

class _ConsolterPropertypageState extends State<ConsolterPropertypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.propertyName),
      body: PropertyDetailPage(),
    );
  }
}
