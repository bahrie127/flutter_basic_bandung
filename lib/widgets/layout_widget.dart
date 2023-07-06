import 'package:flutter/material.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key});

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        padding: EdgeInsets.all(4),
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 50,
            color: Colors.red,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 20,
                    width: 50,
                    color: Colors.black,
                  ),
                ],
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.red,
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.black,
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.red,
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.black,
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.red,
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.black,
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.red,
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.green,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.yellow,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.purple,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.red,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.black,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.red,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.black,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.red,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.black,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.red,
          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
