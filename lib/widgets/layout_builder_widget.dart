import 'package:flutter/material.dart';
import 'package:flutter_basic/models/student.dart';

class LayoutBuilderWidget extends StatefulWidget {
  const LayoutBuilderWidget({super.key});

  @override
  State<LayoutBuilderWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Data')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final student = students[index];
          return InkWell(
            onTap: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(
              //     content: Text('Tranfer berhasil'),
              //     backgroundColor: Colors.blue,
              //   ),
              // );
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text('Info'),
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(student.id.toString()),
                        Divider(),
                        Text(student.name),
                        Divider(),
                        Text(student.address),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        )
                      ],
                    );
                    // return AlertDialog(
                    //   title: const Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Text('Info Detail'),
                    //       Divider(
                    //         height: 1,
                    //       ),
                    //     ],
                    //   ),
                    //   content: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Text('${student.id}'),
                    //       Text(student.name),
                    //       Text(student.address),
                    //     ],
                    //   ),
                    //   actions: [
                    //     ElevatedButton(
                    //       onPressed: () {
                    //         Navigator.pop(context);
                    //       },
                    //       child: const Text('Cancel'),
                    //     )
                    //   ],
                    // );
                  });
            },
            child: Card(
              child: ListTile(
                title: Text(student.name),
                subtitle: Text(student.address),
                leading: CircleAvatar(child: Text('${student.id}')),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit'),
                ),
              ),
            ),
          );
        },
        itemCount: students.length,
      ),
    );
  }
}
