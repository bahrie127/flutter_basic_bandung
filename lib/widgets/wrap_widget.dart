import 'package:flutter/material.dart';
import 'package:flutter_basic/models/student.dart';

class WrapWidget extends StatefulWidget {
  const WrapWidget({super.key});

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap Data')),
      body: Wrap(
        // runSpacing: 8,
        spacing: 16,
        alignment: WrapAlignment.end,
        children: students
            .map(
              (e) => Chip(
                label: Text(
                  e.id.toString(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
