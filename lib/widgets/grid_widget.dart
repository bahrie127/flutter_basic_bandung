import 'package:flutter/material.dart';

import 'package:flutter_basic/models/student.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 8 / 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 160,
                  child: Image.asset(students[index].foto),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(students[index].id.toString()),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(students[index].name),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Text(
                      'students[index].addressstudents[index]. addressstudents[index].addressstudents[index].address'),
                ),
              ],
            ),
          );
        },
        itemCount: students.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.keyboard_return_outlined),
      ),
    );
  }
}
