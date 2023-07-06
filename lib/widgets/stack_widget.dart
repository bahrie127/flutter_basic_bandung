import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Stack Data')),
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.redAccent,
              ),
            ),
            Container(
              width: 250,
              height: 250,
              color: Colors.amberAccent,
            ),
            Positioned(
              //<-- SEE HERE
              right: 60,
              top: 50,
              child: Container(
                width: 230,
                height: 230,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ));
  }
}
